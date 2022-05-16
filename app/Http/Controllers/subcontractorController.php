<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\subcontractor;
use App\subcontractor_attr;
use Illuminate\Support\Facades\Validator;
use DB;
use App\workflow;
use App\notification;
use Carbon\Carbon;
use App\subcontractor_request_cycle;

use App\Jobs\rolecc;
use App\Jobs\sendcc;

use App\Exceptions\CustomException;

class subcontractorController extends Controller
{

    
    public function presubcontractorreturn(request  $request){
   
    
        return view('subcontractor.previewdef');
            
             
            
        
           }

public function index(){
    return view('subcontractor.index');
}

public function create(){
    return view('subcontractor.create');
}

  public function subcontractorinsrting(request $request){
  
$data =  $this->validate($request,[
   'project_id'=>['required','numeric'],
   'date'=>['required','date','max:255'],
'subject'=>['required','string','max:255'],

   'to'=>['string','max:255'],
   
    ]);
    try{

        DB::transaction(function () use ($request,$data) {

    $subcon = subcontractor::create([
        'project_id'=>$request->project_id,

        'user_id'=>auth()->user()->id,
    
        'status'=>0,

      'total'=>$request->total,
        
      'vat'=>$request->vat,
        
       'date'=>$request->date,
    
        'subject'=>$request->subject,
    
        'to'=>$request->to,
'contract_no'=>$request->contract_no,
    ]);

    $rules = [
          
       
        "qty"  => "required|numeric",
    
       
        'dis'=> "required|string",
       'unit'=> "string|max:255",
       
       'unit_price'=> "required|numeric",
       
    ];

    $attributes = json_decode($request->attr, true);
    $users = json_decode($request->users, true);

foreach($attributes as $attr){
 
    $validator = Validator::make($attr,

        $rules

     );
    
    
    if ($validator->passes()) {
        subcontractor_attr::insert([
        'name'=>$attr['dis'],
          'qty'=>$attr['qty'],
           'unit'=>$attr['unit'],
            'unit_price'=>$attr['unit_price'],

           'total'=>$attr['unit_price'] * $attr['qty'] ?? 0,
            
         'subcontractor_id'=>$subcon->id,
            
        ]);
    }else{
     
        $errors  = $validator->errors()->toArray();
        $data = json_encode($errors);
      
                throw new CustomException ($data);

    }
}
$rules = [
          
       
    'id' => 'required|exists:users,id',

];
if(!empty($users)){
    
    $content   = 'user name:'.' '.auth()->user()->name  ?? ''.'Project Name:'.' '.$subcon->project->name ?? ''.'has been created:' .' '. $subcon->ref . 'is waiting for review';
    foreach($users as $user){
 
        $validator = Validator::make($user,[
    
            $rules
    
        ] );
        if ($validator->passes()) {
        $subcon->mention()->attach([
    $user['id']
        ]);
        dispatch_now(new sendcc($user,$content));
    }
    else{
        /*
        $errors  = $validator->errors()->toArray();
        $data = json_encode($errors);
      
                throw new CustomException ($data);  
                */
    }
    }
}


$workflow = workflow::where('name','subcontractor')->first()->flowworkStep()
->first();



foreach( $workflow->role->user as $flow){

    notification::create([

        'type'=>8,
        'read'=>1,
        'name'=>'New Subcontractor Request',
      'user_id_to'=>$flow->id,
         'user_id_from'=>auth()->user()->id,
         
    ]);

    $user = $flow;
    $content = 'New Subcontractor Request';

    dispatch_now(new rolecc($user,$content));



 }


subcontractor_request_cycle::insert([
 'step'=>1,
 'status'=>0,
 'flowwork_step_id'=>$workflow->id,
 'role_id'=>$workflow->role_id,
 'subcontractor_id'=>$subcon->id
]);

});

    }
    catch (Exception $e) {
        return $e;
    }
  }

  public function subcontractorreturn( $subcontractor){
    if (is_numeric($subcontractor)){
        
        $data = subcontractor::where('id',$subcontractor)->with(['attributes'])->with(['subcontractor'=>function($q){
            return  $q
            ->with(['comment_subcontractor_cycle'=> function($qu){
                return $qu->with('user');
            }])->with('role');
            }])->first();

    if(!empty($data)){
    return view('subcontractor.preview')->with(['data'=>$data]);
    }
    }
     }
  
  

   

     public function returnasjson(){
      $purchase = auth()->user()->subcontractor()->orderBy('created_at','DESC')
      ->with(['subcontractor'=>function($q){
        return   $q->with('role');
       }])->paginate(10);
      return response()->json(['data'=>$purchase]);
     }
  
     public function delete(subcontractor $subcontractor){
         if($subcontractor->user_id == auth()->user()->id){
            $subcontractor->delete();
         }
       
     }

}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\petty_cash;
use App\petty_attr;
use App\notification;
use App\workflow;
use App\flowworkStep;
use App\Jobs\sendcc;
use App\petty_cash_cycle;
use Illuminate\Support\Facades\Validator;
use DB;
use App\Exceptions\CustomException;

class petty_cashController extends Controller
{

    public function index(){
        return view('petty_cash.index');
    }

    public function prepetty_cashreturn(request  $request){
   
    
        return view('petty_cash.previewdef');
            
             
            
        
           }

    public function create(){
        return view('petty_cash.create');
    }
    
      public function insrting(request $request){
      
    $data =  $this->validate($request,[
       'project_id'=>['required','numeric','max:255'],
       'date'=>['required','date','max:255'],
    'subject'=>['required','string','max:255'],
    
       'to'=>['string','max:255'],
       
        ]);
        try{
    
            DB::transaction(function () use ($request,$data) {
    
        $subcon = petty_cash::create([
            'project_id'=>$request->project_id,
    
            'user_id'=>auth()->user()->id,
        
            'status'=>0,
    
          'total'=>$request->total,
            
          'vat'=>$request->vat,
            
           'date'=>$request->date,
           'content'=>$request->content,
            'subject'=>$request->subject,
        
            'to'=>$request->to,

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
            petty_attr::insert([
            'name'=>$attr['dis'],
              'qty'=>$attr['qty'],
               'unit'=>$attr['unit'],
                'unit_price'=>$attr['unit_price'],
    
               'total'=>$attr['unit_price'] * $attr['qty'] ?? 0,
                
             'petty_cash_id'=>$subcon->id,
                
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
    $content   = 'user name:'.' '.auth()->user()->name ?? ''.'Project Name:'.' '.$subcon->project->name ?? ''.'has been created:' .' '. $subcon->ref . 'is waiting for review';
    if(!empty($users)){
    foreach($users as $user){
     
    
    
 
        if ($validator->passes()) {
        $subcon->mention()->attach([
    $user['id']
        ]);
        dispatch_now(new sendcc($user,$content));


    }
    else{
        $errors  = $validator->errors()->toArray();
        $data = json_encode($errors);
      
                throw new CustomException ($data);  
    }
  

}
    
    }
$workflow = workflow::where('name','petty_cash')->first()->flowworkStep()
->first();


foreach( $workflow->role->user as $flow){

    notification::create([

        'type'=>3,
        'read'=>1,
        'name'=>'New petty cash Request',
      'user_id_to'=>$flow->id,
         'user_id_from'=>auth()->user()->id,
         
    ]);

 }

petty_cash_cycle::insert([
 'step'=>1,
 'status'=>0,
 'flowwork_step_id'=>$workflow->id,
 'role_id'=>$workflow->role_id,
 'petty_cash_id'=>$subcon->id
]);

    
    });
    
        }
        catch (Exception $e) {
            return $e;
        }
      }
    
      public function petty_cashreturn( $petty_cash){
        if (is_numeric($petty_cash)){
            
            $data = petty_cash::where('id',$petty_cash)->with(['attributes'])->with(['petty_cash_cycle'=>function($q){
                return  $q
                ->with(['comment_petty_cash_cycle'=> function($qu){
                    return $qu->with('user');
                }]);
                }])->first();

        if(!empty($data)){
        return view('petty_cash.preview')->with(['data'=>$data]);
        }
        }
         }
      
      
    
       
    
         public function returnasjson(){
          $petty_cash = auth()->user()->petty_cash()->orderBy('created_at','DESC')
          ->with(['petty_cash_cycle'=>function($q){
            return   $q->with('role');
           }])->paginate(10);
          return response()->json(['data'=>$petty_cash]);
         }
      
         
         public function delete(petty_cash $petty_cash){
             if($petty_cash->user_id == auth()->user()->id){
                $petty_cash->delete();
             }
           
         }
    
    }
    

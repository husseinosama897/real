<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\matrial_request;
use App\matrial_attr;
use Illuminate\Support\Facades\Validator;
use DB;
use Carbon\Carbon;
use App\workflow;
use App\notification;
use App\flowworkStep;
use App\matrial_request_cycle;
use App\attachment_matrial_cycle;
use App\Exceptions\CustomException;
use App\Jobs\sendcc;
use App\matrial_condition as note;
class matrial_requestController extends Controller
{

    
    public function matrial_requestprereturn(request  $request){
   
        $data  =
        [
 'ref'=>$request->def,
 'to'=>$request->to,
 'date'=>$request->date,
 'subject'=>$request->subject,
 'content'=>$request->content,
'attributes' => json_decode($request->attr, true),
'note' => json_decode($request->condition, true),
        ];

 
     return view('matrial_request.previewdef')->with(['data'=>$data]);
         
        
        }

    public function create(){
        return view('matrial_request.create');
    }
 
    public function insarting(request $request){
       $data =  $this->validate($request,[
        'quotation'=>['string','max:255'],
       'project_id'=>['required','numeric','max:255'],
       'date'=>['required','date','max:255'],
   'subject'=>['required','string','max:255'],
  
    
       'ref'=>['string','max:255'],
       'to'=>['string','max:255'],
        
        ]);
 
 try{
 
     DB::transaction(function () use ($request,$data) {
 $matrial_request = matrial_request::create([
    
     'project_id'=>$data['project_id'],
     'date'=>$data['date'],
 'subject'=>$data['subject'],
 'content'=>$request->content,
    'user_id'=>auth()->user()->id,
    'ref'=>$data['ref'],
    'status'=>0,
    'total'=>$request->total + $request->vat,
    'vat'=>$request->vat,
     
     'to'=>$data['to'],
     
 
 
 ]);
 


 $rules = [
           
        
     "qty"  => "required|numeric",
 
    
     'dis'=> "required|string",
    'unit'=> "string|max:255",
    
    'unit_price'=> "required|numeric",
    
 ];
 
 $attributes = json_decode($request->attr, true);
 $condition = json_decode($request->condition, true);
 $users = json_decode($request->users, true);
 
 foreach($attributes as $attr){
    $validator = Validator::make(
        array('qty' => $attr['qty']),
        array('qty' => array('required','numeric')),
        array('dis' => $attr['dis']),
        array('dis' => array('required|string')),

        array('unit' => $attr['unit']),
        array('unit' => array('string|max:255')),
        
        array('unit_price' => $attr['unit_price']),
        array('unit' => array('required','numeric'))

    );
     
     if ($validator->passes()) {
         matrial_attr::insert([
         'name'=>$attr['dis'],
           'qty'=>$attr['qty'],
            'unit'=>$attr['unit'],
             'unit_price'=>$attr['unit_price'],
 
            'total'=>$attr['unit_price'] * $attr['qty'] ?? 0,
             
          'matrial_request_id'=>$matrial_request->id,
             
         ]);
     }else{
      
         $errors  = $validator->errors()->toArray();
         $data = json_encode($errors);
       
                 throw new CustomException ($data);
 
     }
 }
if(!empty($users)){
 foreach($users as $user){
    $rules = [
              
           
        'id' => 'required|exists:users,id',
    
    ];
     $validator = Validator::make($user,
 
         $rules
 
      );
     if ($validator->passes()) {
     $matrial_request->mention()->attach([
 $user['id']
     ]);
     
 }


 else{
     $errors  = $validator->errors()->toArray();
     $data = json_encode($errors);
   
             throw new CustomException ($data);  
 }
 }
}
 
 
 $rules = [
 
     'dis'=> "required|string",
 
 ];
 
 if(!empty($condition)){
 foreach($condition as $pay){
     $validator = Validator::make($pay, $rules);
     
     if ($validator->passes()) {
         note::insert([
         'dis'=>$pay['dis'],
         'matrial_request_id'=>$matrial_request->id,
             
         ]);
     }else{
      
      $errors  = $validator->errors()->toArray();
 $data = json_encode($errors);
 
         throw new CustomException ($data);
     }
    }
 }
 
 
 $workflow = workflow::where('name','matrial_request')->first()->flowworkStep()
 ->first();

 foreach( $workflow->role->user as $flow){

    notification::create([

        'type'=>2,
        'read'=>1,
        'name'=>'New Matrial Request',
      'user_id_to'=>$flow->id,
         'user_id_from'=>auth()->user()->id,
         
    ]);

 }


matrial_request_cycle::insert([
  'step'=>1,
  'status'=>0,
  'flowwork_step_id'=>$workflow->id,
  'role_id'=>$workflow->role_id,
  'matrial_request_id'=>$matrial_request->id
]);


     });
 


 }
 catch (Exception $e) {
     return $e;
 }
 
 
 
    }
 
    public function matrial_requestreturn( $matrial_request){
     if (is_numeric($matrial_request)){
         
        $data = matrial_request::where('id',$matrial_request)->with(['attributes','note'])->with(['matrial_request_cycle'=>function($q){
            return  $q->with(['comment_matrial_cycle'=> function($qu){
                return $qu->with('user');
            }]);
            }])->first();

         if(!empty($data)){
             return view('matrial_request.preview')->with(['data'=>$data]);
         }
      
     }
 
    }
 
 
    public function index(){
  
        return view('matrial_request.index');
    }
 
    public function returnasjson(){
     $matrial_request = auth()->user()->matrial_request()->orderBy('created_at','DESC')
     ->with(['matrial_request_cycle'=>function($q){
        return   $q->with('role');
       }])->paginate(10);
     return response()->json(['data'=>$matrial_request]);
    }
 
    public function delete(matrial_request $matrial_request){
     if($matrial_request->user_id == auth()->user()->id){
        $matrial_request->delete();
     }
    }
 }
 
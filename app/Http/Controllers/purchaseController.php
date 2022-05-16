<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Purchase_order;
use App\Purchase_order_attr;
use Illuminate\Support\Facades\Validator;
use DB;
use App\workflow;
use Carbon\Carbon;
use App\notification;
use App\Jobs\sendcc;
use App\Jobs\rolecc;
use App\purchase_order_attachment;
use App\purchase_order_cycle;
use App\Exceptions\CustomException;
use App\payment_term as note;
class purchaseController extends Controller
{
    public function prepurchasereturn(request  $request){
   
    
        return view('purchase.previewdef');
            
             
            
        
           }

           
   public function createpurchaseorder(){
       return view('purchase.create');
   }

   public function insarting_data(request $request){
      $data =  $this->validate($request,[
       
      'project_id'=>['required','numeric','max:255'],
      'date'=>['required','date','max:255'],
  'subject'=>['required','string','max:255'],
     'material_avalibility'=>['string','max:255'],
    'transportation'=>['string','max:255'],
   'delivery_date'=>['required','date','max:255'],
     'cc'=>['string','max:255'],
      'ref'=>['string','max:255'],
      'to'=>['string','max:255'],
     

       ]);

try{

    DB::transaction(function () use ($request,$data) {
$Purchase_order = Purchase_order::create([
  
    'project_id'=>$data['project_id'],
    'date'=>$data['date'],
'subject'=>$data['subject'],
   'material_avalibility'=>$data['material_avalibility'],
   'user_id'=>auth()->user()->id,
  'transportation'=>$data['transportation'],
 'delivery_date'=>$data['delivery_date'],
   'status'=>0,
   'total'=>$request->total + $request->vat,
   'vat'=>$request->vat,
    'ref'=>$request->ref,
    'to'=>$data['to'],
    'order_for'=>$request->order_for,
 

]);

$attributes = json_decode($request->attr, true);
$payment = json_decode($request->payment, true);
$users = json_decode($request->users, true);
$files = [];
if($request->count > 0){
 for($counter = 0;  $counter <= $request->count;  $counter++){
  
     $img = 'files-'.$counter;
     
       if($request->$img){
         $image_tmp = $request->$img;
         $fileName = $image_tmp->getClientOriginalExtension();
   
         $extension = $image_tmp->getClientOriginalExtension();
                 
         $image_tmp->move('uploads/purchase_order', $fileName);

   $files[] = [
                'purchase_id'=>$Purchase_order->id,
                'path'=>$fileName,
               ];
     ++$counter;
     }else{
       $fileName = null;
     
     }


   }

   $chunkfille = array_chunk($files, 3);
   if(!empty($chunkfille)){
       foreach($chunkfille as $chunk){
         purchase_order_attachment::insert($chunk);
       }
          }
          
}

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

 
    
    if ($validator->passes() == true) {
        Purchase_order_attr::insert([
        'name'=>$attr['dis'],
          'qty'=>$attr['qty'],
           'unit'=>$attr['unit'],
            'unit_price'=>$attr['unit_price'],

           'total'=>$attr['unit_price'] * $attr['qty'] ?? 0,
            
         'purchase_order_id'=>$Purchase_order->id,
            
        ]);
    }else{
     
        $errors  = $validator->errors()->toArray();
        $data = json_encode($errors);
      
                throw new CustomException ($data);

    }
}

$content   = 'user name:'.' '.auth()->user()->name ?? ''.'Project Name:'.' '.$Purchase_order->project->name ?? ''.'has been created:' .' '. $Purchase_order->ref . 'is waiting for review';
if(!empty($users)){
    $rules = [
              
           
        'id' => 'required|exists:users,id',
    
    ];

    foreach($users as $user){
 
        $validator = Validator::make($user,
    
            $rules
    
         );
        if ($validator->passes()) {
        $Purchase_order->mention()->attach([
    $user['id']
        ]);
   
        dispatch_now(new sendcc($user,$content));


    }
    else{
   
                
    }
    }
    
}


$rules = [

    'dis'=> "required|string",

];

if(!empty($payment)){
    foreach($payment as $pay){
        $validator = Validator::make($pay, $rules);
        
        if ($validator->passes()) {
            note::insert([
            'dis'=>$pay['dis'],
            'purchase_order_id'=>$Purchase_order->id,
                
            ]);
        }else{
         
         $errors  = $validator->errors()->toArray();
    $data = json_encode($errors);
    
            throw new CustomException ($data);
        }
    }
}


 $workflow = workflow::where('name','purchase_order')->first()->flowworkStep()
 ->first();
 
 foreach( $workflow->role->user as $flow){

    notification::create([

        'type'=>4,
        'read'=>1,
        'name'=>'New purchase Request',
      'user_id_to'=>$flow->id,
         'user_id_from'=>auth()->user()->id,  
    ]);
    $user = $flow;
    $content = 'New purchase Request';
  dispatch_now(new rolecc($user,$content));
 }


purchase_order_cycle::insert([
    'step'=>1,
    'status'=>0,
    'flowwork_step_id'=>$workflow->id,
    'role_id'=>$workflow->role_id,
    'purchase_order_id'=>$Purchase_order->id
  ]);
    });

}
catch (Exception $e) {
    return $e;
}



   }

   public function purchasereturn( $Purchase_order){
    if (is_numeric($Purchase_order)){
        $data = Purchase_order::where('id',$Purchase_order)->with(['attributes','note'])->with(['purchase_order_cycle'=>function($q){
            return  $q->with(['comment_purchase_order_cycle'=> function($qu){
                return $qu->with('user');
            }])->with(['role'=> function($q){
               
            }]);
            }])->first();
        if(!empty($data)){
            return view('purchase.preview')->with(['data'=>$data]);
        }
     
    }

   }


   public function index(){
 
       return view('purchase.index');
   }

   public function returnasjson(){
    $purchase = auth()->user()->purchase()->with(['purchase_order_cycle'=>function($q){
   return $q->with('role');
    }])->orderBy('created_at','DESC')->paginate(10);
    return response()->json(['data'=>$purchase]);
   }

   public function delete(Purchase_order $Purchase_order){
    if($Purchase_order->user_id == auth()->user()->id){
       $Purchase_order->delete();
    }
   }
}

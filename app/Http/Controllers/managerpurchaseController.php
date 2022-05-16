<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\workflow;
use App\flowworkStep;
use App\Purchase_order_cycle;
use App\comment_purchase_cycle;
use App\attachment_purchase_cycle;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use App\Purchase_order;
use DB;
use App\notification;
use App\Jobs\sendcc;
use App\Services\GoogleSheet;
use Illuminate\Support\Facades\Storage;
use App\Exceptions\CustomException;

class managerpurchaseController extends Controller
{
    public function index(){
        return view('managers.purchase_order.index');
    }
 
    public function returnjsonpurchase(){
     $purchase_order = auth()->user()->role
     ->purchase_order_cycle()->with(['purchase_order'=>function($query){
         $query->orderBy('created_at','DESC')->with('user');
     }])->paginate(10);
 
     return response()->json(['data'=>$purchase_order]);
    }
 
    
 
    public function purchasereturn( $purchase_order){
     if (is_numeric($purchase_order)){
         $data = Purchase_order::where('id',$purchase_order)->with(['attributes','note'])->with(['purchase_order_cycle'=>function($q){
            return  $q->with(['comment_purchase_order_cycle'=> function($qu){
                return $qu->with('user');
            }])->with(['role'=> function($q){
               
            }]);
            }])->first();
         if(!empty($data)){
             return view('managers.purchase_order.preview')->with(['data'=>$data]);
         }
      
     }
 
    }
 
    public function update( $Purchase_order){
     if (is_numeric($Purchase_order)){
     $data = Purchase_order::where('id',$Purchase_order)->with(['purchase_order_cycle'=>function($q){
             return  $q->with(['comment_purchase_order_cycle'=> function($qu){
                 return $qu->with('attachment_purchase_order_cycle');
             }])->with('role');
             }])->with('purchase_order_attachment')->with('attributes')->with('note')->first();
         if(!empty($data)){
             
             return view('managers.purchase_order.update')->with(['data'=>$data]);
         }
      
     }
 
    }
 
 public function action(request $request,Purchase_order $Purchase_order){
 
 
     $data =  $this->validate($request,[
         'quotation'=>['string','max:255'],
        'project_id'=>['required','numeric','max:255'],
        'date'=>['required','date','max:255'],
    'subject'=>['required','string','max:255'],
   
    'status'=>['required','numeric','between:1,2'],
        'ref'=>['string','max:255'],
        'to'=>['string','max:255'],
       
  
         ]);
  
  try{
  
      DB::transaction(function () use ($request,$Purchase_order,$data) {
          
  $Purchase_order->update([
     
      'project_id'=>$data['project_id'],
      'date'=>$data['date'],
  'subject'=>$data['subject'],
 

     'ref'=>$data['ref'],
    'order_for'=>$request->order_for,
     
      'to'=>$data['to'],
      
     
  
  ]);

  
  $purchase_order_cycle =  $Purchase_order->purchase_order_cycle()->orderBy('id', 'DESC')->first();
  if($purchase_order_cycle->status == 0){

    $purchase_order_cycle->status = $request->status;
    $purchase_order_cycle ->save();
    $perv = workflow::where(['name'=>'purchase_order'])->first()->flowworkStep()->where(['step'=> $purchase_order_cycle->step])
    ->first();

       $workflow = workflow::where(['name'=>'purchase_order'])->first()->flowworkStep()->where(['step'=> $purchase_order_cycle->step+1])
       ->first();
   if($request->status == 1){

      
       $content   = 'Your PO' .$Purchase_order->ref.'has been approved by'.$perv->role->name ?? ''.' and Under Review from '.$workflow->role->name ?? 'no one';



       dispatch_now(new sendcc($Purchase_order->user,$content,$request->contentmanager));


       notification::create([
        'type'=>4,
        'read'=>1,
        'name'=>'Your PO' .$Purchase_order->ref.'has been approved ',
      'user_id_to'=>$Purchase_order->user_id,
         'user_id_from'=>auth()->user()->id,  
    ]);



       if(!empty($workflow)  ){
   purchase_order_cycle::insert([
               'step'=>$purchase_order_cycle->step + 1,
               'status'=>0,
               'flowwork_step_id'=>$workflow->id,
               'role_id'=>$workflow->role_id,
               'purchase_order_id'=>$Purchase_order->id
           ]);
   
       }else  {
        $Purchase_order->update([
'status'=>1,
     ]);
 }
   }elseif($request->status == 2){
    $content   = 'Your' .$Purchase_order->ref.'has been rejected by'.$perv->role->name ;

    dispatch_now(new sendcc($Purchase_order->user,$content,$request->contentmanager));

    $Purchase_order->update([
        'status'=>2,
                        ]);


                        notification::create([

                            'type'=>4,
                            'read'=>1,
                            'name'=>'Your' .$Purchase_order->ref.'has been rejected by',
                          'user_id_to'=>$Purchase_order->user_id,
                             'user_id_from'=>auth()->user()->id,  
                        ]);
  
                        
                        
} 
   
 
      
       $comment_purchase_cycle = comment_purchase_cycle::create([
           'purchase_order_cycle_id'=>$purchase_order_cycle->id,
           'content'=>$request->contentmanager ?? 'No Comment',
           'user_id'=>auth()->user()->id,
       ]);
       

       
   
  
          $files = [];
         if($request->count > 0){
          for($counter = 0;  $counter <= $request->count;  $counter++){
            $img = 'files-'.$counter;

     


       
                if($request->$img){

                  $image_tmp = $request->$img;
                  
               $fileName = 'purchase_order_'.'_'.'code_'.'' .$Purchase_order->id. Carbon::now().'_step_'.$purchase_order_cycle->step;
          Storage::disk('google')->put($fileName
          ,file_get_contents($image_tmp));

            ++$counter;
           
          
              ++$counter;
              }else{
              
              
              }

            
 
         
        }


        }
          

  }

      });
  

  }
  catch (Exception $e) {
      return $e;
  }
  
 }
    
 
 }
 
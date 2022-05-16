<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\workflow;
use Carbon\Carbon;
use App\notification;
use App\flowworkStep;
use App\matrial_request_cycle;
use App\comment_matrial_cycle;
use App\attachment_matrial_cycle;
use App\matrial_request;
use Illuminate\Support\Facades\Storage;
use DB;
use App\Exceptions\CustomException;
use App\matrial_condition as note;
use App\Jobs\sendcc;

class managersMatrialrequestController extends Controller
{
   public function index(){
       return view('managers.matrial_request.index');
   }

   public function returnjsonmatrial(){
    $matrial_request = auth()->user()->role
    ->matrial_request_cycle()->orderBy('created_at','DESC')->with('matrial_request')->paginate(10);

    return response()->json(['data'=>$matrial_request]);
   }

   

   public function matrial_requestreturn( $matrial_request){
    if (is_numeric($matrial_request)){
        $data = matrial_request::where('id',$matrial_request)->with(['attributes','note'])->with(['matrial_request_cycle'=>function($q){
            return  $q->with(['comment_matrial_cycle'=> function($qu){
                return $qu->with('user');
            }]);
            }])->first();
        if(!empty($data)){
            return view('managers.matrial_request.preview')->with(['data'=>$data]);
        }
     
    }

   }

   public function updatematrial_requestreturn( $matrial_request){
    if (is_numeric($matrial_request)){
    
        $data = matrial_request::where('id',$matrial_request)->with(['matrial_request_cycle'=>function($q){
            return  $q->with(['comment_matrial_cycle'=> function($qu){
                return $qu->with('attachment_matrial_cycle');
            }])->with('role');
            }])->with('attributes')->with('note')->first();
        if(!empty($data)){
            return view('managers.matrial_request.update')->with(['data'=>$data]);
        }
     
    }

   }

public function action(request $request,matrial_request $matrial_request){


    $data =  $this->validate($request,[
        'quotation'=>['string','max:255'],
       'project_id'=>['required','numeric','max:255'],
       'date'=>['required','date','max:255'],
   'subject'=>['required','string','max:255'],
  
    
       'ref'=>['string','max:255'],
       'to'=>['string','max:255'],
     
 
        ]);
 
 try{
 
     DB::transaction(function () use ($request,$matrial_request,$data) {
 $matrial_request->update([
    
     'project_id'=>$data['project_id'],
     'date'=>$data['date'],
 'subject'=>$data['subject'],

    'user_id'=>auth()->user()->id,
    'ref'=>$data['ref'],
    'status'=>$request->status,
    
     'to'=>$data['to'],
     
     
 
 ]);
 $matrial_request_cycle =  $matrial_request->matrial_request_cycle()->orderBy('id', 'DESC')->first();


 if($matrial_request_cycle->status == 0){
 $matrial_request_cycle->status = $request->status;
 $matrial_request_cycle ->save();

 $perv = workflow::where(['name'=>'matrial_request'])->first()->flowworkStep()->where(['step'=> $matrial_request_cycle->step])
 ->first();

 
if($request->status == 1){
   
    $workflow = workflow::where(['name'=>'matrial_request'])->first()->flowworkStep()->where(['step'=> $matrial_request_cycle->step+1])
    ->first();

  
    $content   = 'Your matrial request' .$matrial_request->ref.'has been approved by'.$perv->role->name ?? ''.' and Under Review from '.$workflow->role->name ?? 'no one';



    dispatch_now(new sendcc($matrial_request->user,$content,$request->contentmanager));



    if(!empty($workflow)){
matrial_request_cycle::insert([
            'step'=>$matrial_request_cycle->step + 1,
            'status'=>0,
            'flowwork_step_id'=>$workflow->id,
            'role_id'=>$workflow->role_id,
            'matrial_request_id'=>$matrial_request->id
        ]);

            
        notification::create([
            'type'=>2,
            'read'=>1,
            'name'=>'Your matrial request' .$matrial_request->ref.'has been approved ',
          'user_id_to'=>$matrial_request->user_id,
             'user_id_from'=>auth()->user()->id,  
        ]);




    } else  {
        $matrial_request->update([
'status'=>1,
     ]);
 }
}elseif($request->status == 2){

    $matrial_request->update([
        'status'=>2,
                        ]);

                        $content   = 'Your matrial request' .$matrial_request->ref.'has been rejected by'.$perv->role->name ;

                        dispatch_now(new sendcc($matrial_request->user,$content,$request->contentmanager));
            
                        notification::create([
                            'type'=>2,
                            'read'=>1,
                            'name'=>$content,
                          'user_id_to'=>$matrial_request->user_id,
                             'user_id_from'=>auth()->user()->id,  
                        ]);

}


    $comment_matrial_cycle = comment_matrial_cycle::create([
        'matrial_request_cycle_id'=>$matrial_request_cycle->id,
        'content'=>$request->contentmanager ?? 'No Comment',
        'user_id'=>auth()->user()->id,
    ]);
    


  


       $files = [];
      
       if($request->count > 0){
        for($counter = 0;  $counter <= $request->count;  $counter++){
        
            $img = 'files-'.$counter;
            
              if($request->$img){
                $image_tmp = $request->$img;
                
                        
                $fileName = 'matrial_request_'.'_'.'code_'.'' .$matrial_request->id. Carbon::now().'_step_'.$matrial_request_cycle->step;
                Storage::disk('google')->put($fileName
                 ,file_get_contents($image_tmp));

                 

                    $extension = $image_tmp->getClientOriginalExtension();
                    $fileName = rand(111,99999).'.'.$extension;
                    $image_tmp->move('uploads/matrial_request', $fileName);
            ++$counter;
            }else{
              $fileName = null;
            
            }
            $files[] = [
             'comment_matrial_cycle_id'=>$comment_matrial_cycle->id,
             'path'=>$fileName,
            ];
            
            }
           
            $chunkfille = array_chunk($files, 3);
           foreach($chunkfille as $chunk){
            attachment_matrial_cycle::insert($chunk);
            
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

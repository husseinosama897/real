<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\subcontractor;
use App\subcontractor_attr;
use Illuminate\Support\Facades\Validator;
use DB;
use App\workflow;
use App\flowworkStep;
use Carbon\Carbon;
use App\subcontractor_request_cycle;
use App\comment_subcontractor_cycle;
use Illuminate\Support\Facades\Storage;
use App\attachment_subcontractor_cycle;
use App\Jobs\sendcc;
use App\notification;

use App\Exceptions\CustomException;

class subcontractorManagerController extends Controller
{

    public function index(){
        return view('managers.subcontractor.index');
    }
    
    public function update( $subcontractor){
     
        if (is_numeric($subcontractor)){
            $data = subcontractor::where('id',$subcontractor)->with(['subcontractor'=>function($q){
                return  $q
                ->with(['comment_subcontractor_cycle'=> function($qu){
                    return $qu->with('attachment_subcontractor_cycle');
                }])->with('role');
                }])->first();
            if(!empty($data)){
        return view('managers.subcontractor.update')->with('data',$data);
            }
        }
    }
    
      public function action(request $request,subcontractor $subcontractor){
      
    $data =  $this->validate($request,[
       'project_id'=>['required','numeric'],
       'date'=>['required','date','max:255'],
    'subject'=>['required','string','max:255'],
    'status'=>['required','numeric','between:1,2'],
       'to'=>['string','max:255'],
       
        ]);
        try{
    
            DB::transaction(function () use ($request,$data,$subcontractor) {
    
        $subcontractor->update([
            'project_id'=>$request->project_id,
    
         
            'status'=>0,
    
          'total'=>$request->total,
          'contract_no'=>$request->contract_no,
          'vat'=>$request->vat,
            
           'date'=>$request->date,
        
            'subject'=>$request->subject,
        
            'to'=>$request->to,
 
        ]);
    
     

        $subcontractor_request_cycle =  $subcontractor->subcontractor()->orderBy('id', 'DESC')->first();
      
        if($subcontractor_request_cycle->status == 0){
        $subcontractor_request_cycle->status = $request->status;
        $subcontractor_request_cycle ->save();
       
        $perv = workflow::where(['name'=>'subcontractor'])->first()->flowworkStep()->where(['step'=> $subcontractor_request_cycle->step])
        ->first();
    

        if($request->status == 1){
    
            $workflow = workflow::where(['name'=>'subcontractor'])->first()->flowworkStep()->where(['step'=> $subcontractor_request_cycle->step+1])
            ->first();
        


            $content   = 'Your subcontractor' .$subcontractor->ref.'has been approved by'.$perv->role->name ?? ''.' and Under Review from '.$workflow->role->name ?? 'no one';

            dispatch_now(new sendcc($subcontractor->user,$content,$request->contentmanager));
           
            notification::create([
                'type'=>8,
                'read'=>1,
                'name'=>$content,
              'user_id_to'=>$subcontractor->user_id,
                 'user_id_from'=>auth()->user()->id,  
            ]);


            


            if(!empty($workflow)){
                subcontractor_request_cycle::insert([
                    'step'=>$subcontractor_request_cycle->step + 1,
                    'status'=>0,
                    'flowwork_step_id'=>$workflow->id,
                    'role_id'=>$workflow->role_id,
                    'subcontractor_id'=>$subcontractor->id
                ]);
        
            }else{
                $subcontractor->update([
'status'=>1,
                ]);
            }
        }elseif($request->status == 2){

            $subcontractor->update([
                'status'=>2,
                                ]);



                                $content   = 'Your subcontractor request' .$subcontractor->ref.'has been rejected by'.$perv->role->name ;

                                dispatch_now(new sendcc($subcontractor->user,$content,$request->contentmanager));
                    
                                notification::create([
                                    'type'=>8,
                                    'read'=>1,
                                    'name'=>$content,
                                  'user_id_to'=>$subcontractor->user_id,
                                     'user_id_from'=>auth()->user()->id,  
                                ]);         

        }
    
   
            $comment_subcontractor_cycle = comment_subcontractor_cycle::create([
                'subcontractor_request_cycle_id'=>$subcontractor_request_cycle->id,
                'content'=>$request->contentmanager ?? 'No Comment',
                'user_id'=>auth()->user()->id,
            ]);
            
        

        $files = [];
      if(!empty($comment_subcontractor_cycle)){
          if($request->count > 0){
        for($counter = 0;  $counter <= $request->count;  $counter++){
        
            $img = 'files-'.$counter;
            
              if($request->$img){
                $image_tmp = $request->$img;
                
                         
                $fileName = 'subcontractor'.'_'.'code_'.'' .$subcontractor->id. Carbon::now().'_step_'.$subcontractor_request_cycle->step;
                Storage::disk('google')->put($fileName
                 ,file_get_contents($image_tmp));

                    $extension = $image_tmp->getClientOriginalExtension();
                    $fileName = rand(111,99999).'.'.$extension;
                    $image_tmp->move('uploads/subcontractor', $fileName);
            ++$counter;
            }else{
              $fileName = null;
            
            }
         
            $files[] = [
             'comment_subcontractor_cycle_id'=>$comment_subcontractor_cycle->id,
             'path'=>$fileName,
            ];
            
            }
      }
     
           
            $chunkfille = array_chunk($files, 3);
            if(!empty($chunkfille)){
                foreach($chunkfille as $chunk){
                    attachment_subcontractor_cycle::insert($chunk);
                    
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
    
      public function subcontractorreturn( $subcontractor){
        if (is_numeric($subcontractor)){
        $data = subcontractor::where('id',$subcontractor)->with(['attributes'])->with(['subcontractor'=>function($q){
            return  $q
            ->with(['comment_subcontractor_cycle'=> function($qu){
                return $qu->with('user');
            }])->with('role');
            }])->first();
        if(!empty($data)){
        return view('managers.subcontractor.preview')->with(['data'=>$data]);
        }
        }
         }
      
      
    
       
    
         public function returnasjson(){
          $purchase = auth()->user()->role->subcontractor()->orderBy('created_at','DESC')->with('subcontractor_real')->paginate(10);
          return response()->json(['data'=>$purchase]);
         }
      
         public function delete(subcontractor $subcontractor){
             if($subcontractor->user_id == auth()->user()->id){
                $subcontractor->delete();
             }
           
         }
    
    }
    
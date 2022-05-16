<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\employee;
use Illuminate\Support\Facades\Validator;
use DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use App\workflow;
use App\employee_cycle;
use App\Exceptions\CustomException;
use App\comment_employee_cycle;
use App\notification;
use App\Jobs\sendcc;
use App\attachment_employee;
class employeemanagerController extends Controller

{
    

    public function index(){
        return view('managers.employee.index');
    }
    
    public function update( $employee){
     
        if (is_numeric($employee)){
            $data = employee::where('id',$employee)->with(['employee_cycle'=>function($q){
                return  $q
                ->with(['comment_employee_cycle'=> function($qu){
                    return $qu->with('attachment_employee_cycle');
                }])->with('role');
                }])->first();
            if(!empty($data)){
        return view('managers.employee.update')->with('data',$data);
            }
        }
    }
    
      public function action(request $request,employee $employee){
      
    $data =  $this->validate($request,[
       'project_id'=>['required','numeric'],
       'date'=>['required','date','max:255'],
    'subject'=>['required','string','max:255'],
    'status'=>['required','numeric','between:1,2'],
       'to'=>['string','max:255'],
  
        ]);
        try{
    
            DB::transaction(function () use ($request,$data,$employee) {
    
        $employee->update([
            'project_id'=>$request->project_id,
    
           
            'status'=>0,
  
            
           'date'=>$request->date,
        
            'subject'=>$request->subject,
        
            'to'=>$request->to,
            'content'=>$request->content,
        ]);
    
     

        $employee_cycle =  $employee->employee_cycle()->orderBy('id', 'DESC')->first();
        if($employee_cycle->status == 0){
        $employee_cycle->status = $request->status;
        $employee_cycle ->save();
       
        $perv = workflow::where(['name'=>'employee'])->first()->flowworkStep()->where(['step'=> $employee_cycle->step])
        ->first();

        if($request->status == 1){
    
            $workflow = workflow::where(['name'=>'employee'])->first()->flowworkStep()->where(['step'=> $employee_cycle->step+1])
            ->first();
        

            $content   = 'Your employee request' .$employee->ref.'has been approved by'.$perv->role->name ?? ''.' and Under Review from '.$workflow->role->name ?? 'no one';


            dispatch_now(new sendcc($employee->user,$content,$request->contentmanager));
            notification::create([
                'type'=>1,
                'read'=>1,
                'name'=>'Your employee request' .$employee->ref.'has been approved ',
              'user_id_to'=>$employee->user_id,
                 'user_id_from'=>auth()->user()->id,  
            ]);
        

            if(!empty($workflow)){
                employee_cycle::insert([
                    'step'=>$employee_cycle->step + 1,
                    'status'=>0,
                    'flowwork_step_id'=>$workflow->id,
                    'role_id'=>$workflow->role_id,
                    'employee_id'=>$employee->id
                ]);
        
            }elseif(empty($workflow)){
                $employee->update([
        'status'=>1,
             ]);
         }
        }elseif($request->status == 2){

            $employee->update([
                'status'=>2,
                                ]);


                                $content   = 'Your' .$employee->ref.'has been rejected by'.$perv->role->name ;

                                dispatch_now(new sendcc($employee->user,$content,$request->contentmanager));


                                notification::create([
                                    'type'=>1,
                                    'read'=>1,
                                    'name'=>'Your' .$employee->ref.'has been rejected by',
                                  'user_id_to'=>$employee->user_id,
                                     'user_id_from'=>auth()->user()->id,  
                                ]);

        
        }
    
       
            $comment_employee_cycle = comment_employee_cycle::create([
                'employee_cycle_id'=>$employee_cycle->id,
                'content'=>$request->contentmanager ?? 'No Comment',
                'user_id'=>auth()->user()->id,
            ]);
            
        

        $files = [];

      if(!empty($comment_employee_cycle)){
          if($request->count > 0){
        for($counter = 0;  $counter <= $request->count;  $counter++){
        
            $img = 'files-'.$counter;
            
              if($request->$img){

                
                $image_tmp = $request->$img;
                

                $fileName = 'employee_'.'_'.'code_'.'' .$employee->id. Carbon::now().'_step_'.rand(1,90000000);
                Storage::disk('google')->put($fileName
                 ,file_get_contents($image_tmp));

               
            ++$counter;
            }else{
              $fileName = null;
            
            }
         
            $files[] = [
             'comment_employee_cycle_id'=>$comment_employee_cycle->id,
             'path'=>$fileName,
            ];
            
            }
      }
     
            $chunkfille = array_chunk($files, 3);
            if(!empty($chunkfille)){
                foreach($chunkfille as $chunk){
                    attachment_employee::insert($chunk);
                    
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
    
      public function employeereturn( $employee){
        if (is_numeric($employee)){
        $data = employee::where('id',$employee)->with(['employee_cycle'=>function($q){
            return  $q
            ->with(['comment_employee_cycle'=> function($qu){
                return $qu->with('user');
            }]);
            }])->first();
        if(!empty($data)){
        return view('managers.employee.preview')->with(['data'=>$data]);
        }
        }
         }
      
      
    
       
    
         public function returnasjson(){
          $purchase = auth()->user()->role->employee_cycle()->with('employee')->orderBy('created_at','DESC')->paginate(10);
          return response()->json(['data'=>$purchase]);
         }
      
         public function delete(employee $employee){
             if($employee->user_id == auth()->user()->id){
                $employee->delete();
             }
           
         }
    
    }
    

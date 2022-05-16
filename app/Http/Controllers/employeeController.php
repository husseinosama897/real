<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\employee;
use Illuminate\Support\Facades\Validator;
use DB;
use App\workflow;
use App\employee_cycle;
use App\notification;
use App\Jobs\sendcc;
use App\Jobs\rolecc;
class employeeController extends Controller
{
    public function insrting(request $request){
        $data =  $this->validate($request,[
            'project_id'=>['required','numeric','max:255'],
            'date'=>['required','date','max:255'],
         'subject'=>['required','string','max:255'],
         'ref'=>['string','max:255'],
            'to'=>['string','max:255'],
         
             ]);
             try{

                DB::transaction(function () use ($request,$data) {
        

             $employee = employee::create([
                'project_id'=>$data['project_id'],
                'date'=>$data['date'],
            'subject'=>$data['subject'],
               'user_id'=>auth()->user()->id,
               'status'=>0,
                'ref'=>$data['ref'],
                'to'=>$data['to'],
            'content'=>$request->content,
            ]);

            $workflow = workflow::where('name','employee')->first()->flowworkStep()
            ->first();
           
           
           employee_cycle::insert([
             'step'=>1,
             'status'=>0,
             'flowwork_step_id'=>$workflow->id,
             'role_id'=>$workflow->role_id,
             'employee_id'=>$employee->id
           ]);

           
     foreach( $workflow->role->user as $flow){

        notification::create([

            'type'=>1,
            'read'=>1,
            'name'=>'New Employee Request',
          'user_id_to'=>$flow->id,
             'user_id_from'=>auth()->user()->id,
             
        ]);

        
    $user = $flow;
    $content = 'New Employee Request';

    dispatch_now(new rolecc($user,$content));


     }
        

            $rules = [
          
       
                'id' => 'required|exists:users,id',
            
            ];
            $users = json_decode($request->users, true);

            if(!empty($users)){
                foreach($users as $user){
             
                    $validator = Validator::make($user,[
                
                        $rules
                
                    ] );
                    if ($validator->passes()) {
                    $employee->mention()->attach([
                $user['id']
                    ]);
                }
                else{
                    $errors  = $validator->errors()->toArray();
                    $data = json_encode($errors);
                  
                      //      throw new CustomException ($data);  
                }
                }  
            }
      

        });

    }
    catch (Exception $e) {
        return $e;
    }
    }


    public function preemployeereturn(request  $request){
   
    
    return view('employee.previewdef');
        
         
        
    
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
             
                return view('employee.preview')->with(['data'=>$data]);
            }
         
        }
    
       }


       public function index(){
 
        return view('employee.index');
    }
 
    public function create(){
        return view('employee.create');
    }


    public function returnasjson(){
     $employee = auth()->user()->employee()->orderBy('created_at','DESC')->with(['employee_cycle'=>function($q){
        return   $q->with('role');
       }])->paginate(10);
     return response()->json(['data'=>$employee]);
    }
 
    public function delete(employee $employee){
        
     if($employee->user_id == auth()->user()->id){
        $employee->delete();
     }
    }


}

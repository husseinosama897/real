<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\site;
use Illuminate\Support\Facades\Validator;
use DB;
use App\notification;
use App\workflow;
use App\site_cycle;
use App\Jobs\rolecc;
use App\Jobs\sendcc;
class siteController extends Controller
{


    
    public function presitereturn(request  $request){
   
    
        return view('site.previewdef');
            
             
            
        
           }

           
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
        

             $site = site::create([
            
                'project_id'=>$data['project_id'],
                'date'=>$data['date'],
            'subject'=>$data['subject'],
               'user_id'=>auth()->user()->id,
               'status'=>0,
                'ref'=>$data['ref'],
                'to'=>$data['to'],
                'content'=>$request->content,
            
            ]);
            $workflow = workflow::where('name','site_request')->first()->flowworkStep()
            ->first();

            foreach( $workflow->role->user as $flow){

                notification::create([
        
                    'type'=>7,
                    'read'=>1,
                    'name'=>'New Site Request',
                  'user_id_to'=>$flow->id,
                     'user_id_from'=>auth()->user()->id,
                     
                ]);
                $user = $flow;
                $content = 'New RFQ Request';

                dispatch_now(new rolecc($user,$content));
        
             }
           
          site_cycle::insert([
             'step'=>1,
             'status'=>0,
             'flowwork_step_id'=>$workflow->id,
             'role_id'=>$workflow->role_id,
             'site_id'=>$site->id
           ]);

           
            $rules = [
          
       
                'id' => 'required|exists:users,id',
            
            ];
            $users = json_decode($request->users, true);
            $content   = 'user name:'.' '.auth()->user()->name  ?? ''.'Project Name:'.' '.$site->project->name ?? ''.'has been created:' .' '. $site->ref . 'is waiting for review';
            if(!empty($users)){
            foreach($users as $user){
             
                $validator = Validator::make($user,
            
                    $rules
            
                 );
                if ($validator->passes()) {
                $site->mention()->attach([
            $user['id']
                ]);
                dispatch_now(new sendcc($user,$content));
            }
            else{
                $errors  = $validator->errors()->toArray();
                $data = json_encode($errors);
              
                        
            }
           
        }
        }
        });

    }
    catch (Exception $e) {
        return $e;
    }
    }

    public function sitereturn( $site){
        if (is_numeric($site)){
            $data = site::where('id',$site)->with(['site_cycle'=>function($q){
                return  $q
                ->with(['comment_site_cycle'=> function($qu){
                    return $qu->with('user');
                }]);
                }])->first();
                
            if(!empty($data)){
                return view('site.preview')->with(['data'=>$data]);
            }
         
        }
    
       }


       public function index(){
 
        return view('site.index');
    }
 
    public function create(){
        return view('site.create');
    }


    public function returnasjson(){
     $site = auth()->user()->site()->with(['site_cycle'=>function($q){
     return    $q->with('role');
     }])->orderBy('created_at','DESC')->paginate(10);
     return response()->json(['data'=>$site]);
    }
 
    public function delete(site $site){
        
     if($site->user_id == auth()->user()->id){
        $site->delete();
     }
    }


}

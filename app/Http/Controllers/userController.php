<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\role;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
class userController extends Controller
{
    public function autocomplete(request $request){

        $validate = $this->validate($request,[
'name'=>['required','max:255','string']
        ]);
      
        $data = User::where('name', 'LIKE', '%' .$request->name . '%')
        ->select(['name','id','email'])->get()->take(4);
        return response()->json(['data'=>$data]);

    }


    public function jsonUser(){

      
        $data = User::select(['name','role_id','email','admin','manager','id'])->with('role')->paginate(10);
        return response()->json(['data'=>$data]);

    }


    public function role(){
        $role = role::get();
        return response()->json(['data'=>$role]);
    }

    public function rig(){
   return view('managers.adduser');     
    }
    
    public function edit(User $User){
        return view('managers.edituser')->with('data',$User);     
         }

    public function usertable(){
        return view('managers.usertable');     
         }


    public function add(request $request){
        
     $this->validate($request, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],

        ]);
        

        
            
        if($request->sign){
          $image_tmp = $request->sign;

              $extension = $image_tmp->getClientOriginalExtension();
              $fileName = rand(111,99999).'.'.$extension;
              $image_tmp->move('uploads/sign', $fileName);
     
      }else{
        $fileName = null;
      
      }




        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role_id'=>$request->role_id,
            'sign'=>$fileName,
        ]);  
    }
    public function update(request $request ,User $User){
        
        $this->validate($request, [
               'name' => ['required', 'string', 'max:255'],
               'email' => [ 'string', 'email', 'max:255', 'unique:users'],
               'password' => [ 'string', 'min:8', 'confirmed'],
   
           ]);
           
   
           
               
           if($request->sign){
             $image_tmp = $request->sign;
   
                 $extension = $image_tmp->getClientOriginalExtension();
                 $fileName = rand(111,99999).'.'.$extension;
                 $image_tmp->move('uploads/sign', $fileName);
      
         }else{
           $fileName = null;
         
         }
   
   
   
   if($request->name){
    $User-> name = $request->name;
   }
         
            if($request->email){
           $User->email = $request->email;
            }
            
            if($request->password){
                $User->password = Hash::make($request->password);
                 }
                 if($request->role_id){
                    $User->role_id = $request->role_id;
                     }

                     if($fileName){
                    
                        $User->sign = $fileName;

                        
                         }

                     
    
            $User->save();
 
       }


       public function adminornot(User $User){
           if($User->admin == 1){
            $User->admin = 0;
            $User->save();
           }elseif($User->admin == 0){
            $User->admin = 1;
            $User->save();
           }
       }

       
       public function managerornot(User $User){
        if($User->manager == 1){
         $User->manager = 0;
         $User->save();
        }elseif($User->manager == 0){
         $User->manager = 1;
         $User->save();
        }
    }
}

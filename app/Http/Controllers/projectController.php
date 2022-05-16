<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\project;

class projectController extends Controller
{

    public function delete(project $project){
$project->delete();
    }
public function index(){
    return view('project.index');
}

public function json(){
    $data = project::paginate(10);
    return response()->json(['data'=>$data]);
}
public function create(request $request){
$this->validate($request,[
'name'=>['required','string','max:255'],
]);

 $project =  project::create([
    'name'=>$request->name,
]);
return response()->json(['data'=>$project]);
}

public function update(request $request , project $project){
    $this->validate($request,[
        'name'=>['required','string','max:255'],
        ]);
        
      $project->update([
            'name'=>$request->name,
        ]);
}

public function edit( project $project){
    return view('project.edit');
}


public function selectproject(){
    $data = project::get()->chunk(10);
    return response()->json(['data'=>$data]);
}
}

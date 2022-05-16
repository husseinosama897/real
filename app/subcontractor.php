<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class subcontractor extends Model
{
    protected $fillable = [
     'project_id',

        'user_id',

        'status',

      'total',
        
      'vat',
        
       'date',

        'subject',

        'to',
'contract_no',

    ];
    
   public function attributes(){
    return $this->HasMany(subcontractor_attr::class,'subcontractor_id');
 }

 public function file(){
    return $this->HasMany(subcontractor_file::class,'subcontractor_id');
 }




 public function mention(){
    
    return $this->belongstoMany(User::class,'subcontractor_User')->withPivot(['subcontractor_id','user_id']);
 }

 public function subcontractor(){
   return $this->HasMany(subcontractor_request_cycle::class,'subcontractor_id');
}


public function project(){
   return $this->belongsto(project::class,'project_id');
}


}

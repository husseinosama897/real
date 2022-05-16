<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class employee extends Model
{
    protected $fillable = [
        'project_id',
        'date',
    'subject',
      'status',
       'user_id',
    
    
        'ref',
        'to',
        
         'content',
       ];

       
   public function mention(){
     return $this->belongstoMany(User::class,'employee_user')->withPivot(['employee_id','user_id']);
 }


 public function employee_cycle(){
  return $this->HasMany(employee_cycle::class,'employee_id');
}

}

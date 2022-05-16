<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class petty_cash extends Model
{
   protected $fillable = [
    'quotation',

'project_id',
 'user_id',

'status',
'total',
'vat',
  'date',
'subject',
   'material_avalibility',	
 'transportation',
'delivery_date',
'cc',
 'ref',
'to',
   'content',

   ];

   
   public function project(){
    return $this->belongsto(project::class,'project_id');
 }

 public function attributes(){
    return $this->HasMany(petty_attr::class,'petty_cash_id');
 }

 
public function mention(){
  
 return $this->belongstoMany(User::class,'petty_cash_user')->withPivot(['petty_cash_id','user_id']);
}


public function petty_cash_cycle(){
   return $this->HasMany(petty_cash_cycle::class,'petty_cash_id');
}


}

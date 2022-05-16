<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Purchase_order extends Model
{
   protected $fillable = [
    'quotation',
    'project_id',
    'status',
    'date',
'subject',
   'material_avalibility',
  'transportation',
 'delivery_date',
   'cc',
    'ref',
    'user_id',
    'to',
     'order_for',
     'total',
     'vat'
   ];

   public function attributes(){
      return $this->HasMany(Purchase_order_attr::class,'purchase_order_id');
   }

   public function note(){
      return $this->HasMany(payment_term::class,'purchase_order_id');
   }


   public function project(){
      return $this->belongsto(project::class,'project_id');
   }

   public function user(){
      return $this->belongsto(User::class,'user_id');
   }
   
 public function mention(){
    
   return $this->belongstoMany(user::class,'purchase_order_user')->withPivot(['purchase_order_id','user_id']);
}

public function purchase_order_cycle(){
   return $this->HasMany(purchase_order_cycle::class,'purchase_order_id');
}


public function purchase_order_attachment(){
   return $this->HasMany(purchase_order_attachment::class,'purchase_id');
}
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class role extends Model
{
    public function petty_cash_cycle(){
        return $this->HasMany(petty_cash_cycle::class,'role_id')->orderBy('created_at','DESC');
    }

    public function matrial_request_cycle(){
        return $this->HasMany(matrial_request_cycle::class,'role_id')->orderBy('created_at','DESC');
    }
    public function rfq_cycle(){
        return $this->HasMany(rfq_cycle::class,'role_id')->orderBy('created_at','DESC');
    }
    
    public function employee_cycle(){
        return $this->HasMany(employee_cycle::class,'role_id')->orderBy('created_at','DESC');
    }

    public function site_cycle(){
        return $this->HasMany(site_cycle::class,'role_id')->orderBy('created_at','DESC');
    }
    public function subcontractor(){
        return $this->HasMany(subcontractor_request_cycle::class,'role_id')->orderBy('created_at','DESC');
    }

    public function purchase_order_cycle(){
        return $this->HasMany(purchase_order_cycle::class,'role_id')->orderBy('created_at','DESC');
    }

    public function user(){
        return $this->HasMany(User::class,'role_id');
    }
    
}

<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','role_id','sign'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function purchase(){
        return $this->HasMany(Purchase_order::class,'user_id');
    }
    public function subcontractor(){
        return $this->HasMany(subcontractor::class,'user_id');
    }
    public function rfq(){
        return $this->HasMany(rfq::class,'user_id');
    }
    public function employee(){
        return $this->HasMany(employee::class,'user_id');
    }
    public function site(){
        return $this->HasMany(site::class,'user_id');
    }
    public function petty_cash(){
        return $this->HasMany(petty_cash::class,'user_id');
    }
    public function matrial_request(){
        return $this->HasMany(matrial_request::class,'user_id');
    }


    public function role(){
        return $this->belongsto(role::class,'role_id');
    }
   
    public function notification(){
        return $this->hasMany(notification::class,'user_id_to')->orderBy('created_at','DESC');
    }
   
 
}

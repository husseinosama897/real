<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class SiteUser extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('site_user', function (Blueprint $table) {
            $table->id();
            
            $table->unsignedBigInteger('site_id')->unsigned()->nullable();
   
            
            $table->unsignedBigInteger('user_id')->unsigned()->nullable();
     


            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}

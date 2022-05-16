<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMatrialRequestCyclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('matrial_request_cycles', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('matrial_request_id')->unsigned()->nullable();
            $table->integer('step')->nullable();
            $table->integer('status')->nullable();
            $table->unsignedBigInteger('flowwork_step_id')->unsigned()->nullable();
            $table->unsignedBigInteger('role_id')->unsigned()->nullable();
            
            
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
        Schema::dropIfExists('matrial_request_cycles');
    }
}

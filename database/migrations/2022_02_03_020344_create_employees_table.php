<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmployeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
            
            $table->unsignedBigInteger('project_id')->unsigned()->nullable();
         
          
            $table->string('to')->nullable();
            $table->unsignedBigInteger('user_id')->unsigned()->nullable();
      
            $table->integer('status')->nullable();
            $table->string('ref')->nullable();

            $table->string('date')->nullable();

            $table->string('subject')->nullable();

            $table->text('content')->nullable();


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
        Schema::dropIfExists('employees');
    }
}

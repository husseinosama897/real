<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentEmployeeCyclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comment_employee_cycles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('employee_cycle_id')->unsigned()->nullable();
            $table->text('content')->nullable();
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
        Schema::dropIfExists('comment_employee_cycles');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRfqCyclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rfq_cycles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('rfq_id')->unsigned()->nullable();
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
        Schema::dropIfExists('rfq_cycles');
    }
}

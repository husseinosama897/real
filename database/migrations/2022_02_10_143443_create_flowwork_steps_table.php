<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFlowworkStepsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('flowwork_steps', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('role_id')->unsigned()->nullable();
            $table->unsignedBigInteger('work_flow_id')->unsigned()->nullable();
            $table->integer('step')->nullable();

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
        Schema::dropIfExists('flowwork_steps');
    }
}

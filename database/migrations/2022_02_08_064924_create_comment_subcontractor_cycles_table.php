<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentSubcontractorCyclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comment_subcontractor_cycles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('subcontractor_request_cycle_id')->unsigned()->nullable();
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
        Schema::dropIfExists('comment_subcontractor_cycles');
    }
}

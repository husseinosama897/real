<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentRfqCyclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comment_rfq_cycles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('rfq_cycle_id')->unsigned()->nullable();
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
        Schema::dropIfExists('comment_rfq_cycles');
    }
}

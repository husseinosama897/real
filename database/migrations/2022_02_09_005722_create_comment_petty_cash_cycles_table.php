<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentPettyCashCyclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comment_petty_cash_cycles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('petty_cash_cycle_id')->unsigned()->nullable();
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
        Schema::dropIfExists('commeny_petty_cash_cycles');
    }
}

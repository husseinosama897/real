<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAttachmentPettyCashCyclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('attachment_petty_cash_cycles', function (Blueprint $table) {
            $table->id();
            
            $table->unsignedBigInteger('comment_petty_cash_cycle_id')->unsigned()->nullable();
            $table->text('path')->nullable();
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
        Schema::dropIfExists('attachment_petty_cash_cycles');
    }
}

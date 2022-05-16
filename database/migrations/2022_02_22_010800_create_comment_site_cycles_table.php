<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentSiteCyclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comment_site_cycles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('site_cycle_id')->unsigned()->nullable();
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
        Schema::dropIfExists('comment_site_cycles');
    }
}

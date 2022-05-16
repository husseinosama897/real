<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePettyCashesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('petty_cashes', function (Blueprint $table) {
            $table->id();
            $table->string('quotation')->nullable();

            $table->unsignedBigInteger('project_id')->unsigned()->nullable();
           
            $table->unsignedBigInteger('user_id')->unsigned()->nullable();
         
$table->integer('status')->nullable();
$table->float('total')->nullable();
$table->float('vat')->nullable();
            $table->string('date')->nullable();
            $table->string('subject')->nullable();
            $table->string('material_avalibility')->nullable();		
            $table->string('transportation')->nullable();
            $table->string('delivery_date')->nullable();
            $table->string('cc')->nullable();
            $table->string('ref')->nullable();
            $table->string('to')->nullable();
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
        Schema::dropIfExists('petty_cashes');
    }
}

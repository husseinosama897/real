<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubcontractorAttrsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subcontractor_attrs', function (Blueprint $table) {
            $table->id();
            $table->text('name')->nullable();
            $table->float('qty')->nullable();
            $table->string('unit')->nullable();
            $table->float('unit_price')->nullable();
            $table->float('total')->nullable();
            $table->unsignedBigInteger('subcontractor_id')->unsigned()->nullable();
            $table->foreign('subcontractor_id')->references('id')->on('subcontractors')->ondelete('cascade')
            ->noupdate('cascade')->nullable();
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
        Schema::dropIfExists('subcontractor_attrs');
    }
}

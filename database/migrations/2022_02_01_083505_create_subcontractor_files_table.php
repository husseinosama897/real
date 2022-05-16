<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubcontractorFilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subcontractor_files', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('subcontractor_id')->unsigned()->nullable();
            $table->foreign('subcontractor_id')->references('id')->on('subcontractors')->ondelete('cascade')
            ->noupdate('cascade')->nullable();
            $table->string('file')->nullable();
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
        Schema::dropIfExists('subcontractor_files');
    }
}

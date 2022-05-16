<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePurchaseOrderAttrsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchase_order_attrs', function (Blueprint $table) {
            $table->id();
            $table->text('name')->nullable();
            $table->float('qty')->nullable();
            $table->string('unit')->nullable();
            $table->float('unit_price')->nullable();
            $table->float('total')->nullable();

            $table->unsignedBigInteger('purchase_order_id')->unsigned()->nullable();
           

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
        Schema::dropIfExists('purchase_order_attrs');
    }
}

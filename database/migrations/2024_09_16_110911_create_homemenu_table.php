<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHomemenuTable extends Migration
{
    public function up()
    {
        Schema::create('homemenu', function (Blueprint $table) {
            $table->id();
            $table->string('label'); // Menu item label
            $table->string('url')->nullable(); // URL for the menu item
            $table->integer('parent_id')->nullable(); // For handling sub-menus
            $table->integer('order')->default(0); // For ordering the menus
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('homemenu');
    }
}

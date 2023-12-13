<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use illuminate\Support\Schema\nullable;

return new class extends Migration
{
   
    public function up(): void
    {
        Schema::table('books', function (Blueprint $table) {
            $table->string('claimed_by_name')->nullable()->change();
        });
    }

    public function down(): void
    {
        Schema::table('books', function (Blueprint $table) {
            $table->string('claimed_by_name')->nullable(false)->change();
        });
    }
};

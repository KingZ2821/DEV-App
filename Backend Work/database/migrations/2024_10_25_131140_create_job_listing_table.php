<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('job_listing', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(\App\Models\Employer::class);
            $table->timestamps();
            $table->string('title');
            $table->string('salary');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
    }
};
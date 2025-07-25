<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
   public function up()
{
    Schema::create('books', function (Blueprint $table) {
        $table->id();
        $table->string('title');
        $table->string('author');
        $table->string('image')->nullable();
        $table->string('background_image')->nullable();
        $table->decimal('price', 8, 2);
        $table->float('rating', 2, 1)->default(0);
        $table->integer('reviews')->default(0);
        $table->text('description')->nullable();
        $table->string('asin')->nullable();
        $table->year('publication_date')->nullable();
        $table->string('language')->default('English');
        $table->string('publisher')->nullable();
        $table->integer('pages')->nullable();
        $table->string('book_format')->nullable();
        $table->string('best_seller_rank')->nullable();
$table->decimal('old_price', 8, 2)->nullable();
$table->boolean('in_stock')->default(true);


        $table->timestamps();

    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('books');
    }
};

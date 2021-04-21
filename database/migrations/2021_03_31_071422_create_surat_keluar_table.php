<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSuratKeluarTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('surat_keluar', function (Blueprint $table) {
            $table->id();
            $table->Integer('id_pengirim');
            $table->Integer('id_kategori');
            $table->Integer('id_tujuan');
            $table->string('judul', 50);
            $table->longText('content');
            $table->string('status', 20)->default('diproses');
            $table->string('stat_tu', 10)->default('menunggu');
            $table->string('stat_prof', 10)->nullable()->default('menunggu');
            $table->string('ttd', 5)->default('tidak');
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
        Schema::dropIfExists('surat_keluar');
    }
}

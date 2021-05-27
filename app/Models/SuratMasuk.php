<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Kategori;
use App\Models\SuratKeluar;
use App\Models\User;

class SuratMasuk extends Model
{
    use HasFactory;
    protected $table = 'surat_masuk';
    public $timestamps = false;
    protected $guarded = [];
    public function userterima(){
        return $this->belongsTo(User::class, 'id_penerima');
    }
    public function userkirim(){
        return $this->belongsTo(User::class, 'id_pengirim');
    }
    public function kategori(){
        return $this->belongsTo(Kategori::class, 'id_kategori');
    }
    public function surat(){
        return $this->belongsTo(SuratKeluar::class, 'id_surat');
    }
}

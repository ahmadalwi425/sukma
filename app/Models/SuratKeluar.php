<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Kategori;
use App\Models\User;

class SuratKeluar extends Model
{
    use HasFactory;
    protected $table = 'surat_keluar';
    protected $primaryKey = 'id';
    public $incrementing = true;
    protected $fillable = [
        'id_pengirim',
        'id_kategori',
        'id_tujuan',
        'judul',
        'content',
        'status',
        'stat_tu',
        'stat_prof',
        'ttd'
        ];

    public function kategori(){
        return $this->belongsTo(Kategori::class, 'id_kategori');
    }
    public function userterima(){
        return $this->belongsTo(User::class, 'id_tujuan');
    }
    public function userkirim(){
        return $this->belongsTo(User::class, 'id_pengirim');
    }
}

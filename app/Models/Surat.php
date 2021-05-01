<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\kategori;

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
}

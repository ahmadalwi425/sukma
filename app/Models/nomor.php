<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\SuratKeluar;

class nomor extends Model
{
    use HasFactory;
    protected $table = 'data_nomor';
    public $timestamps = false;
    protected $guarded = [];
    public function suratkeluar(){
        return $this->belongsTo(SuratKeluar::class, 'id_surat');
    }
}

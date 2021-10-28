<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\SuratKeluar;

class kategori extends Model
{
    use HasFactory;
    protected $table = 'kategori';
    protected $guarded = [];
    public $timestamps = false;
    public function SuratKeluar(){
        return $this->hasMany(SuratKeluar::class);
    }
}

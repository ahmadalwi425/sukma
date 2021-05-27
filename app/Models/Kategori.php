<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\SuratKeluar;

class Kategori extends Model
{
    use HasFactory;
    protected $table = 'kategori';
    public function SuratKeluar(){
        return $this->hasMany(SuratKeluar::class);
    }
}

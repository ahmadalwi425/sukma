<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use App\Models\SuratKeluar;
use App\Models\SuratMasuk;
use App\Models\kabag;
use App\Models\level;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    public function SuratKeluar(){
        return $this->belongsTo(SuratKeluar::class, 'id');
    }
    public function level(){
        return $this->belongsTo(level::class, 'id_level');
    }
    public function kabag(){
        return $this->belongsTo(kabag::class, 'id_kabag');
    }
    public function SuratMasuk(){
        return $this->belongsTo(SuratMasuk::class, 'id');
    }
    // protected $fillable = [
    //     'username',
    //     'name',
    //     'email',
    //     'password',
    // ];
    protected $guarded = [];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class level extends Model
{
    use HasFactory;
    protected $table = 'level';
    public $timestamps = false;
    protected $guarded = [];
    public function user(){
        return $this->hasMany(user::class);
    }
}

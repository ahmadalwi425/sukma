<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class kabag extends Model
{
    use HasFactory;
    protected $table = 'kabag';
    public $timestamps = false;
    protected $guarded = [];
    public function user(){
        return $this->hasMany(user::class);
    }
}

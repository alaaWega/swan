<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserDevice extends Model
{
    protected $table = "user_devices";
    protected $fillable = ['device_token', 'user_id'];
    public $timestamps  = false;

    public function getUser()
    {
        return $this->belongsTo('App\User','user_id','id');
    }
}

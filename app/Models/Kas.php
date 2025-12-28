<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kas extends Model
{
    use HasFactory;

    protected $table = 'tbl_kas';
    public $timestamps = false;

    protected $fillable = [
        'nama_kas', 'saldo', 'keterangan'
    ];
}

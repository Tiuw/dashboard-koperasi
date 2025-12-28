<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    use HasFactory;

    protected $table = 'tbl_barang';
    public $timestamps = false;

    protected $fillable = [
        'nm_barang', 'type', 'merk', 'harga', 'jml_brg', 'ket'
    ];
}

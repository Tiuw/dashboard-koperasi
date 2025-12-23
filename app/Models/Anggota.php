<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Anggota extends Model
{
    use HasFactory;

    protected $table = 'tbl_anggota'; // Important: Maps to your SQL
    public $timestamps = false; // Your SQL uses custom timestamp columns or none

    protected $fillable = [
        'nama', 'identitas', 'jk', 'tmp_lahir', 'tgl_lahir',
        'status', 'agama', 'pekerjaan', 'alamat', 'kota',
        'notelp', 'tgl_daftar', 'jabatan_id', 'aktif', 'tanggal_keluar', 'pass_word','departement','file_pic'
    ];
}

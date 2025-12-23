<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pinjaman extends Model
{
    use HasFactory;

    protected $table = 'tbl_pinjaman_h';
    public $timestamps = false;

    protected $fillable = [
        'tgl_pinjam', 'anggota_id', 'barang_id', 'lama_angsuran',
        'jumlah', 'bunga', 'biaya_adm', 'lunas', 'dk', 'kas_id', 'jns_trans', 'user_name', 'keterangan'
    ];
}

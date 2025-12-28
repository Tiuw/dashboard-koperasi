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
        'tgl_pinjam', 'anggota_id', 'barang_id', 'lama_angsuran', 'jml_barang', 'harga_satuan',
        'jumlah', 'bunga', 'biaya_adm', 'lunas', 'dk', 'kas_id', 'jns_trans', 'update_data', 'user_name', 'keterangan', 'contoh'
    ];

    public function anggota()
    {
        return $this->belongsTo(Anggota::class, 'anggota_id');
    }

    public function barang()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }

    public function kas()
    {
        return $this->belongsTo(Kas::class, 'kas_id');
    }
}

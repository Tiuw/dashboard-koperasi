<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Simpanan extends Model
{
    use HasFactory;

    protected $table = 'tbl_trans_sp';
    public $timestamps = false;

    protected $fillable = [
        'tgl_transaksi', 'anggota_id', 'jenis_id', 'jumlah',
        'keterangan', 'akun', 'dk', 'kas_id', 'user_name','nama_penyetor','no_identitas','alamat'
    ];

    public function anggota()
    {
        return $this->belongsTo(Anggota::class, 'anggota_id');
    }

    public function jenis()
    {
        return $this->belongsTo(Jenis::class, 'jenis_id');
    }

    public function kas()
    {
        return $this->belongsTo(Kas::class, 'kas_id');
    }
}

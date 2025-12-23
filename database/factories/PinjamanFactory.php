<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class PinjamanFactory extends Factory
{
    protected $model = \App\Models\Pinjaman::class;

    public function definition(): array
    {
        $jumlah = $this->faker->numberBetween(1_000_000, 10_000_000);
        return [
            'tgl_pinjam' => $this->faker->dateTimeBetween('-1 year', 'now'),
            'barang_id' => 0, // 0 for cash loan
            'lama_angsuran' => $this->faker->randomElement([6, 12, 24]),
            'jml_barang' => 1,
            'harga_satuan' => $jumlah,
            'jumlah' => $jumlah,
            'bunga' => 2.5,
            'biaya_adm' => 50000,
            'lunas' => 'Belum',
            'dk' => 'D',
            'kas_id' => 1, // Main Cash
            'jns_trans' => 1, // Loan Transaction Code
            'user_name' => 'admin',
            'keterangan' => 'Pinjaman Uang Tunai',
        ];
    }
}

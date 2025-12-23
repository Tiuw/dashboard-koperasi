<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class SimpananFactory extends Factory
{
    protected $model = \App\Models\Simpanan::class;

    public function definition(): array
    {
        return [
            'tgl_transaksi' => $this->faker->dateTimeBetween('-1 year', 'now'),
            'jumlah' => $this->faker->numberBetween(50_000, 500_000),
            'akun' => 'Setoran',
            'dk' => 'D', // Debit (Money coming in to Coop)
            'kas_id' => 1,
            'user_name' => 'admin',
            'nama_penyetor' => $this->faker->name(),
            'no_identitas' => $this->faker->numerify('################'),
            'alamat' => $this->faker->address(),
        ];
    }
}

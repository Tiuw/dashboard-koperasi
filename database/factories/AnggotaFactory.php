<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;

class AnggotaFactory extends Factory
{
    protected $model = \App\Models\Anggota::class;

    public function definition(): array
    {
        return [
            'nama' => $this->faker->name(),
            'identitas' => $this->faker->unique()->numerify('################'),
            'jk' => $this->faker->randomElement(['L', 'P']),
            'tmp_lahir' => $this->faker->city(),
            'tgl_lahir' => $this->faker->date('Y-m-d', '-20 years'),
            'status' => 'Belum Kawin',
            'agama' => 'Islam',
            'pekerjaan' => substr($this->faker->jobTitle(), 0, 20),
            'alamat' => $this->faker->address(),
            'kota' => $this->faker->city(),
            'notelp' => $this->faker->numerify('08##########'),
            'tgl_daftar' => $this->faker->dateTimeBetween('-2 years', 'now'),
            'jabatan_id' => 1, // Default to Anggota
            'aktif' => 'Y', // Active by default
            'pass_word' => Hash::make('password'),
            'departement' => 'Umum', // Or use $this->faker->word()
            'file_pic' => 'default.jpg',
        ];
    }

    // State for Pengurus
    public function pengurus()
    {
        return $this->state(fn (array $attributes) => [
            'jabatan_id' => 2, // Assuming 2 is Pengurus
        ]);
    }
}

<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class JenisBarangSeeder extends Seeder
{
    public function run(): void
    {
        // Tambah jenis simpanan jika belum ada
        $jenisIds = [40, 41, 42];
        $existingJenis = DB::table('tbl_jenis')->whereIn('id', $jenisIds)->pluck('id')->toArray();

        if (!in_array(40, $existingJenis)) {
            DB::table('tbl_jenis')->insert([
                'id' => 40,
                'nama_jenis' => 'Simpanan Pokok',
                'keterangan' => 'Simpanan pokok anggota'
            ]);
        }

        if (!in_array(41, $existingJenis)) {
            DB::table('tbl_jenis')->insert([
                'id' => 41,
                'nama_jenis' => 'Simpanan Wajib',
                'keterangan' => 'Simpanan wajib bulanan'
            ]);
        }

        if (!in_array(42, $existingJenis)) {
            DB::table('tbl_jenis')->insert([
                'id' => 42,
                'nama_jenis' => 'Simpanan Sukarela',
                'keterangan' => 'Simpanan sukarela anggota'
            ]);
        }

        // Tambah jenis barang/pinjaman
        $barangIds = [1, 2, 3, 4, 5];
        $existingBarang = DB::table('tbl_barang')->whereIn('id', $barangIds)->pluck('id')->toArray();

        $barangData = [
            [
                'id' => 1,
                'nm_barang' => 'Pinjaman Tunai',
                'type' => 'Uang',
                'merk' => '-',
                'harga' => 0,
                'jml_brg' => 0,
                'ket' => 'Pinjaman uang tunai'
            ],
            [
                'id' => 2,
                'nm_barang' => 'Pinjaman Motor',
                'type' => 'Kendaraan',
                'merk' => 'Honda',
                'harga' => 15000000,
                'jml_brg' => 0,
                'ket' => 'Pinjaman untuk pembelian motor'
            ],
            [
                'id' => 3,
                'nm_barang' => 'Pinjaman Elektronik',
                'type' => 'Elektronik',
                'merk' => 'Umum',
                'harga' => 5000000,
                'jml_brg' => 0,
                'ket' => 'Pinjaman untuk pembelian barang elektronik'
            ],
            [
                'id' => 4,
                'nm_barang' => 'Pinjaman Renovasi Rumah',
                'type' => 'Properti',
                'merk' => '-',
                'harga' => 20000000,
                'jml_brg' => 0,
                'ket' => 'Pinjaman untuk renovasi rumah'
            ],
            [
                'id' => 5,
                'nm_barang' => 'Pinjaman Pendidikan',
                'type' => 'Pendidikan',
                'merk' => '-',
                'harga' => 10000000,
                'jml_brg' => 0,
                'ket' => 'Pinjaman untuk biaya pendidikan'
            ]
        ];

        foreach ($barangData as $barang) {
            if (!in_array($barang['id'], $existingBarang)) {
                DB::table('tbl_barang')->insert($barang);
            }
        }

        $this->command->info('Data jenis simpanan dan jenis pinjaman berhasil ditambahkan!');
    }
}

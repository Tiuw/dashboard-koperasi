<?php

namespace Database\Seeders;

use App\Models\Anggota;
use App\Models\Pinjaman;
use App\Models\Simpanan;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // 1. Create 5 Pengurus (Staff/Admins)
        $pengurus = Anggota::factory()->count(5)->pengurus()->create();

        // 2. Create 50 Active Anggota (Members)
        $anggotaList = Anggota::factory()->count(50)->create();

        // 3. Loop through each member to create Simpanan & Pinjaman
        foreach ($anggotaList as $anggota) {

            // --- A. Create Simpanan (Savings) ---

            // Simpanan Pokok (Once per member, usually at start)
            Simpanan::factory()->create([
                'anggota_id' => $anggota->id,
                'jenis_id' => 40, // Assuming 40 = Simpanan Pokok
                'jumlah' => 100000,
                'keterangan' => 'Simpanan Pokok Awal',
                'tgl_transaksi' => $anggota->tgl_daftar,
            ]);

            // Simpanan Wajib (Monthly - generate for last 6 months)
            for ($i = 0; $i < 6; $i++) {
                Simpanan::factory()->create([
                    'anggota_id' => $anggota->id,
                    'jenis_id' => 41, // Assuming 41 = Simpanan Wajib
                    'jumlah' => 25000,
                    'keterangan' => 'Simpanan Wajib Bulanan',
                    'tgl_transaksi' => now()->subMonths($i),
                ]);
            }

            // Simpanan Sukarela (Randomly, not everyone has it)
            if (rand(0, 1)) {
                Simpanan::factory()->count(rand(1, 3))->create([
                    'anggota_id' => $anggota->id,
                    'jenis_id' => 42, // Assuming 42 = Simpanan Sukarela
                    'jumlah' => rand(10000, 100000),
                    'keterangan' => 'Tabungan Sukarela',
                ]);
            }

            // --- B. Create Pinjaman (Loans) ---

            // Only 30% of members have active loans
            if (rand(1, 10) <= 3) {
                Pinjaman::factory()->create([
                    'anggota_id' => $anggota->id,
                    'tgl_pinjam' => now()->subMonths(rand(1, 5)), // Spread dates for filtering
                ]);
            }
        }

        // 4. Resign some members (change from active to inactive)
        $activeMembers = Anggota::where('aktif', 'Y')->get();
        $resignCount = (int)($activeMembers->count() * 0.15); // Resign 15% of members
        $resignCount = max(1, $resignCount); // At least 1 member

        $membersToResign = $activeMembers->random(min($resignCount, $activeMembers->count()));
        foreach ($membersToResign as $member) {
            $member->update(['aktif' => 'N']);
        }
    }
}

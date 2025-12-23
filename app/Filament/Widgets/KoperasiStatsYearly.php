<?php

namespace App\Filament\Widgets;

use App\Models\Anggota;
use App\Models\Pinjaman;
use App\Models\Simpanan;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\Concerns\InteractsWithPageFilters;

class KoperasiStatsYearly extends BaseWidget
{
    use InteractsWithPageFilters;

    protected static ?int $sort = 1;

    protected function getStats(): array
    {
        // Get filter values from dashboard
        $year = $this->filters['year'] ?? now()->year;

        // Card 1: Total Pinjaman per tahun
        $totalPinjaman = Pinjaman::whereYear('tgl_pinjam', $year)
            ->sum('jumlah') ?? 0;

        // Hitung perubahan dari tahun sebelumnya
        $pinjamanTahunLalu = Pinjaman::whereYear('tgl_pinjam', $year - 1)
            ->sum('jumlah') ?? 0;
        $perubahanPinjaman = $pinjamanTahunLalu > 0
            ? (($totalPinjaman - $pinjamanTahunLalu) / $pinjamanTahunLalu) * 100
            : 0;

        // Card 2: Total Simpanan (Credit only) dengan breakdown
        $simpananPokok = Simpanan::whereYear('tgl_transaksi', $year)
            ->where('dk', 'K')
            ->where('jenis_id', 1)
            ->sum('jumlah') ?? 0;

        $simpananWajib = Simpanan::whereYear('tgl_transaksi', $year)
            ->where('dk', 'K')
            ->where('jenis_id', 2)
            ->sum('jumlah') ?? 0;

        $simpananSukarela = Simpanan::whereYear('tgl_transaksi', $year)
            ->where('dk', 'K')
            ->where('jenis_id', 3)
            ->sum('jumlah') ?? 0;

        $totalSimpanan = $simpananPokok + $simpananWajib + $simpananSukarela;

        // Hitung perubahan simpanan dari tahun sebelumnya
        $simpananTahunLalu = Simpanan::whereYear('tgl_transaksi', $year - 1)
            ->where('dk', 'K')
            ->sum('jumlah') ?? 0;
        $perubahanSimpanan = $simpananTahunLalu > 0
            ? (($totalSimpanan - $simpananTahunLalu) / $simpananTahunLalu) * 100
            : 0;

        // Card 3: Anggota Baru di tahun ini
        $anggotaBaru = Anggota::whereYear('tgl_daftar', $year)
            ->count();

        $totalAnggotaAktif = Anggota::where('aktif', 'Y')->count();

        // Card 4: Total Peminjam Unik dalam setahun
        $jumlahPeminjam = Pinjaman::whereYear('tgl_pinjam', $year)
            ->distinct('anggota_id')
            ->count('anggota_id');

        // Card 5: Total Anggota Resign dalam setahun
        $totalResign = Anggota::where('aktif', 'N')
            ->whereYear('tanggal_keluar', $year)
            ->count();

        return [
            Stat::make('Total Pinjaman Tahun ' . $year, 'Rp ' . number_format($totalPinjaman, 0, ',', '.'))
                ->description(
                    $perubahanPinjaman >= 0
                        ? number_format(abs($perubahanPinjaman), 1) . '% naik dari tahun lalu'
                        : number_format(abs($perubahanPinjaman), 1) . '% turun dari tahun lalu'
                )
                ->descriptionIcon($perubahanPinjaman >= 0 ? 'heroicon-m-arrow-trending-up' : 'heroicon-m-arrow-trending-down')
                ->color($perubahanPinjaman >= 0 ? 'success' : 'danger')
                ->chart(array_fill(0, 12, rand(50, 100))),

            Stat::make('Total Simpanan Tahun ' . $year, 'Rp ' . number_format($totalSimpanan, 0, ',', '.'))
                ->description(
                    $perubahanSimpanan >= 0
                        ? number_format(abs($perubahanSimpanan), 1) . '% naik dari tahun lalu'
                        : number_format(abs($perubahanSimpanan), 1) . '% turun dari tahun lalu'
                )
                ->descriptionIcon($perubahanSimpanan >= 0 ? 'heroicon-m-arrow-trending-up' : 'heroicon-m-arrow-trending-down')
                ->color($perubahanSimpanan >= 0 ? 'success' : 'danger')
                ->chart(array_fill(0, 12, rand(50, 100))),

            Stat::make('Anggota Baru Tahun ' . $year, number_format($anggotaBaru, 0, ',', '.'))
                ->description('Total anggota aktif: ' . number_format($totalAnggotaAktif, 0, ',', '.'))
                ->descriptionIcon('heroicon-m-user-plus')
                ->color('warning')
                ->chart(array_fill(0, 12, rand(50, 100))),

            Stat::make('Total Peminjam Tahun ' . $year, number_format($jumlahPeminjam, 0, ',', '.'))
                ->description('Jumlah anggota yang melakukan pinjaman dalam ' . $year)
                ->descriptionIcon('heroicon-m-users')
                ->color('info')
                ->chart(array_fill(0, 12, rand(50, 100))),

            Stat::make('Anggota Resign Tahun ' . $year, number_format($totalResign, 0, ',', '.'))
                ->description('Jumlah anggota yang resign sepanjang tahun ' . $year)
                ->descriptionIcon('heroicon-m-user-minus')
                ->color('gray')
                ->chart(array_fill(0, 12, rand(50, 100))),
        ];
    }
}

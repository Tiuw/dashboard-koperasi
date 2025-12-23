<?php

namespace App\Filament\Widgets;

use App\Models\Anggota;
use App\Models\Pinjaman;
use App\Models\Simpanan;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\Concerns\InteractsWithPageFilters;

class KoperasiStats extends BaseWidget
{
    use InteractsWithPageFilters;

    protected static ?int $sort = 3;

    protected function getStats(): array
    {
        // Get filter values from dashboard
        $year = $this->filters['year'] ?? now()->year;
        $month = $this->filters['month'] ?? now()->month;

        // Card 1: Total Pinjaman
        $totalPinjaman = Pinjaman::whereYear('tgl_pinjam', $year)
            ->whereMonth('tgl_pinjam', $month)
            ->sum('jumlah') ?? 0;

        // Card 2: Total Simpanan (Credit only) with breakdown
        $simpananPokok = Simpanan::whereYear('tgl_transaksi', $year)
            ->whereMonth('tgl_transaksi', $month)
            ->where('dk', 'K') // Credit
            ->where('jenis_id', 1)
            ->sum('jumlah') ?? 0;

        $simpananWajib = Simpanan::whereYear('tgl_transaksi', $year)
            ->whereMonth('tgl_transaksi', $month)
            ->where('dk', 'K')
            ->where('jenis_id', 2)
            ->sum('jumlah') ?? 0;

        $simpananSukarela = Simpanan::whereYear('tgl_transaksi', $year)
            ->whereMonth('tgl_transaksi', $month)
            ->where('dk', 'K')
            ->where('jenis_id', 3)
            ->sum('jumlah') ?? 0;

        $totalSimpanan = $simpananPokok + $simpananWajib + $simpananSukarela;

        // Card 3: Data Anggota Aktif
        $totalAnggotaAktif = Anggota::where('aktif', 'Y')->count();
        $jumlahAnggota = Anggota::where('aktif', 'Y')
            ->where('jabatan_id', 1)
            ->count();
        $jumlahPengurus = Anggota::where('aktif', 'Y')
            ->where('jabatan_id', 2)
            ->count();

        // Card 4: Data Peminjam (Unique borrowers this month)
        $jumlahPeminjam = Pinjaman::whereYear('tgl_pinjam', $year)
            ->whereMonth('tgl_pinjam', $month)
            ->distinct('anggota_id')
            ->count('anggota_id');

        // Card 5: Data Anggota Resign (per bulan)
        $resignBulanIni = Anggota::where('aktif', 'N')
            ->whereYear('tanggal_keluar', $year)
            ->whereMonth('tanggal_keluar', $month)
            ->count();

        return [
            Stat::make('Total Pinjaman', 'Rp ' . number_format($totalPinjaman, 0, ',', '.'))
                ->description('Periode: ' . $this->getMonthName($month) . ' ' . $year)
                ->descriptionIcon('heroicon-m-banknotes')
                ->color('success'),

            Stat::make('Total Simpanan', 'Rp ' . number_format($totalSimpanan, 0, ',', '.'))
                ->description(
                    'Pokok: Rp ' . number_format($simpananPokok, 0, ',', '.') . ' | ' .
                    'Wajib: Rp ' . number_format($simpananWajib, 0, ',', '.') . ' | ' .
                    'Sukarela: Rp ' . number_format($simpananSukarela, 0, ',', '.')
                )
                ->descriptionIcon('heroicon-m-currency-dollar')
                ->color('info'),

            Stat::make('Data Anggota Aktif', number_format($totalAnggotaAktif, 0, ',', '.'))
                ->description(
                    $jumlahAnggota . ' Anggota, ' . $jumlahPengurus . ' Pengurus'
                )
                ->descriptionIcon('heroicon-m-user-group')
                ->color('warning'),

            Stat::make('Data Peminjam', number_format($jumlahPeminjam, 0, ',', '.'))
                ->description('Jumlah peminjam di bulan ' . $this->getMonthName($month) . ' tahun ' . $year)
                ->descriptionIcon('heroicon-m-users')
                ->color('danger'),

            Stat::make('Anggota Resign', number_format($resignBulanIni, 0, ',', '.'))
                ->description('Jumlah anggota resign di bulan ' . $this->getMonthName($month) . ' tahun ' . $year)
                ->descriptionIcon('heroicon-m-user-minus')
                ->color('gray'),
        ];
    }

    protected function getMonthName(int $month): string
    {
        $months = [
            1 => 'Januari', 2 => 'Februari', 3 => 'Maret', 4 => 'April',
            5 => 'Mei', 6 => 'Juni', 7 => 'Juli', 8 => 'Agustus',
            9 => 'September', 10 => 'Oktober', 11 => 'November', 12 => 'Desember'
        ];

        return $months[$month] ?? '';
    }
}

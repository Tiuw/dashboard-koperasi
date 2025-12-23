<?php

namespace App\Filament\Widgets;

use App\Models\Anggota;
use App\Models\Pinjaman;
use App\Models\Simpanan;
use Filament\Widgets\ChartWidget;
use Filament\Widgets\Concerns\InteractsWithPageFilters;

class KoperasiChart extends ChartWidget
{
    use InteractsWithPageFilters;

    protected static ?int $sort = 2;
    protected int | string | array $columnSpan = 'full';

    protected function getData(): array
    {
        $year = $this->filters['year'] ?? now()->year;

        // Data untuk setiap bulan
        $pinjamanData = [];
        $simpananData = [];
        $anggotaData = [];
        $peminjamData = [];
        $resignData = [];

        for ($month = 1; $month <= 12; $month++) {
            // Total Pinjaman per bulan
            $pinjamanData[] = Pinjaman::whereYear('tgl_pinjam', $year)
                ->whereMonth('tgl_pinjam', $month)
                ->sum('jumlah') ?? 0;

            // Total Simpanan (Credit) per bulan
            $simpananData[] = Simpanan::whereYear('tgl_transaksi', $year)
                ->whereMonth('tgl_transaksi', $month)
                ->where('dk', 'K')
                ->sum('jumlah') ?? 0;

            // Total Anggota Aktif per bulan (cumulative)
            $anggotaData[] = Anggota::where('aktif', 'Y')
                ->whereYear('tgl_daftar', '<=', $year)
                ->where(function($query) use ($year, $month) {
                    $query->where('tgl_daftar', '<=', "$year-$month-31")
                          ->orWhere('tgl_daftar', '<=', date('Y-m-t', strtotime("$year-$month-01")));
                })
                ->count();

            // Jumlah Peminjam per bulan
            $peminjamData[] = Pinjaman::whereYear('tgl_pinjam', $year)
                ->whereMonth('tgl_pinjam', $month)
                ->distinct('anggota_id')
                ->count('anggota_id');

            // Jumlah Anggota yang Resign per bulan
            $resignData[] = Anggota::where('aktif', 'N')
                ->whereYear('tanggal_keluar', $year)
                ->whereMonth('tanggal_keluar', $month)
                ->count();
        }

        return [
            'datasets' => [
                [
                    'label' => 'Pinjaman (Rp)',
                    'data' => $pinjamanData,
                    'backgroundColor' => 'rgba(59, 130, 246, 0.5)',
                    'borderColor' => 'rgb(59, 130, 246)',
                    'yAxisID' => 'y',
                    'type' => 'bar',
                ],
                [
                    'label' => 'Simpanan (Rp)',
                    'data' => $simpananData,
                    'backgroundColor' => 'rgba(16, 185, 129, 0.5)',
                    'borderColor' => 'rgb(16, 185, 129)',
                    'yAxisID' => 'y',
                    'type' => 'bar',
                ],
                [
                    'label' => 'Jumlah Anggota',
                    'data' => $anggotaData,
                    'backgroundColor' => 'rgba(251, 146, 60, 0.5)',
                    'borderColor' => 'rgb(251, 146, 60)',
                    'yAxisID' => 'y1',
                    'type' => 'line',
                    'tension' => 0.4,
                ],
                [
                    'label' => 'Jumlah Peminjam',
                    'data' => $peminjamData,
                    'backgroundColor' => 'rgba(239, 68, 68, 0.5)',
                    'borderColor' => 'rgb(239, 68, 68)',
                    'yAxisID' => 'y1',
                    'type' => 'line',
                    'tension' => 0.4,
                ],
                [
                    'label' => 'Anggota Resign',
                    'data' => $resignData,
                    'backgroundColor' => 'rgba(168, 85, 247, 0.5)',
                    'borderColor' => 'rgb(168, 85, 247)',
                    'yAxisID' => 'y1',
                    'type' => 'line',
                    'tension' => 0.4,
                ],
            ],
            'labels' => ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Ags', 'Sep', 'Okt', 'Nov', 'Des'],
        ];
    }

    protected function getType(): string
    {
        return 'bar';
    }

    protected function getOptions(): array
    {
        return [
            'scales' => [
                'y' => [
                    'type' => 'linear',
                    'display' => true,
                    'position' => 'left',
                    'title' => [
                        'display' => true,
                        'text' => 'Jumlah (Rp)',
                    ],
                ],
                'y1' => [
                    'type' => 'linear',
                    'display' => true,
                    'position' => 'right',
                    'title' => [
                        'display' => true,
                        'text' => 'Jumlah Orang',
                    ],
                    'grid' => [
                        'drawOnChartArea' => false,
                    ],
                ],
            ],
        ];
    }

    public function getHeading(): ?string
    {
        return 'Grafik Pinjaman, Simpanan, Anggota, Peminjam & Resign per Bulan';
    }

    public function getDescription(): ?string
    {
        $year = $this->filters['year'] ?? now()->year;
        return "Data tahun {$year}";
    }
}

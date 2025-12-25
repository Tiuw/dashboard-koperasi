<?php

namespace App\Filament\Widgets;

use App\Models\Anggota;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;
use Filament\Widgets\Concerns\InteractsWithPageFilters;
use Illuminate\Database\Eloquent\Builder;

class AnggotaResignTable extends BaseWidget
{
    use InteractsWithPageFilters;

    protected static ?int $sort = 4;
    protected int | string | array $columnSpan = 'full';

    public function table(Table $table): Table
    {
        // Get filter values from dashboard
        $year = $this->filters['year'] ?? now()->year;
        $month = $this->filters['month'] ?? now()->month;

        return $table
            ->heading('Daftar Anggota Resign - ' . $this->getMonthName($month) . ' ' . $year)
            ->query(
                Anggota::query()
                    ->where('aktif', 'N')
                    ->whereYear('tanggal_keluar', $year)
                    ->whereMonth('tanggal_keluar', $month)
                    ->orderBy('tanggal_keluar', 'desc')
            )
            ->columns([
                Tables\Columns\TextColumn::make('index')
                    ->label('No')
                    ->rowIndex(),

                Tables\Columns\TextColumn::make('identitas')
                    ->label('No. Anggota')
                    ->searchable()
                    ->copyable()
                    ->copyMessage('Nomor anggota disalin')
                    ->weight('medium'),

                Tables\Columns\TextColumn::make('nama')
                    ->label('Nama Lengkap')
                    ->searchable()
                    ->weight('bold')
                    ->icon('heroicon-m-user')
                    ->color('primary'),

                Tables\Columns\TextColumn::make('jabatan_id')
                    ->label('Jabatan')
                    ->formatStateUsing(fn (string $state): string => match ($state) {
                        '1' => 'Anggota',
                        '2' => 'Pengurus',
                        default => 'Unknown',
                    })
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        '1' => 'success',
                        '2' => 'warning',
                        default => 'gray',
                    }),

                Tables\Columns\TextColumn::make('departement')
                    ->label('Departemen')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('tgl_daftar')
                    ->label('Tanggal Daftar')
                    ->date('d M Y')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('tanggal_keluar')
                    ->label('Tanggal Resign')
                    ->date('d M Y')
                    ->sortable()
                    ->icon('heroicon-m-calendar-days')
                    ->color('danger')
                    ->weight('medium'),

                Tables\Columns\TextColumn::make('masa_kerja')
                    ->label('Masa Aktif')
                    ->getStateUsing(function (Anggota $record): string {
                        $tglDaftar = \Carbon\Carbon::parse($record->tgl_daftar);
                        $tglKeluar = \Carbon\Carbon::parse($record->tanggal_keluar);
                        $diff = $tglDaftar->diff($tglKeluar);

                        $parts = [];
                        if ($diff->y > 0) $parts[] = $diff->y . ' tahun';
                        if ($diff->m > 0) $parts[] = $diff->m . ' bulan';
                        if ($diff->d > 0) $parts[] = $diff->d . ' hari';

                        return empty($parts) ? '0 hari' : implode(', ', $parts);
                    })
                    ->icon('heroicon-m-clock')
                    ->color('info'),
            ])
            ->defaultSort('tanggal_keluar', 'desc')
            ->emptyStateHeading('Tidak ada anggota resign')
            ->emptyStateDescription('Tidak ada anggota yang resign pada periode ini.')
            ->emptyStateIcon('heroicon-o-user-group')
            ->striped();
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

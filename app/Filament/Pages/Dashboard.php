<?php

namespace App\Filament\Pages;

use Filament\Forms\Components\Select;
use Filament\Pages\Dashboard as BaseDashboard;

class Dashboard extends BaseDashboard
{
    use BaseDashboard\Concerns\HasFiltersForm;

    public function filtersForm($form)
    {
        return $form
            ->schema([
                Select::make('year')
                    ->label('Tahun')
                    ->options(function () {
                        $currentYear = now()->year;
                        $years = [];
                        for ($i = $currentYear - 5; $i <= $currentYear + 1; $i++) {
                            $years[$i] = $i;
                        }
                        return $years;
                    })
                    ->default(now()->year)
                    ->selectablePlaceholder(false),

                Select::make('month')
                    ->label('Bulan')
                    ->options([
                        1 => 'Januari',
                        2 => 'Februari',
                        3 => 'Maret',
                        4 => 'April',
                        5 => 'Mei',
                        6 => 'Juni',
                        7 => 'Juli',
                        8 => 'Agustus',
                        9 => 'September',
                        10 => 'Oktober',
                        11 => 'November',
                        12 => 'Desember',
                    ])
                    ->default(now()->month)
                    ->selectablePlaceholder(false),
            ])
            ->columns(1);
    }

    public function getColumns(): int | array
    {
        return [
            'md' => 2,
            'xl' => 3,
        ];
    }
}

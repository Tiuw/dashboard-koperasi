<?php

namespace App\Filament\Admin\Resources\Simpanans\Pages;

use App\Filament\Admin\Resources\Simpanans\SimpananResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ManageRecords;

class ManageSimpanans extends ManageRecords
{
    protected static string $resource = SimpananResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}

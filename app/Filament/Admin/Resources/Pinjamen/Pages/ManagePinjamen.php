<?php

namespace App\Filament\Admin\Resources\Pinjamen\Pages;

use App\Filament\Admin\Resources\Pinjamen\PinjamanResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ManageRecords;

class ManagePinjamen extends ManageRecords
{
    protected static string $resource = PinjamanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}

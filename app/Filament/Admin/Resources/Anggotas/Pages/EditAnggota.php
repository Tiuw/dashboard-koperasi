<?php

namespace App\Filament\Admin\Resources\Anggotas\Pages;

use App\Filament\Admin\Resources\Anggotas\AnggotaResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditAnggota extends EditRecord
{
    protected static string $resource = AnggotaResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}

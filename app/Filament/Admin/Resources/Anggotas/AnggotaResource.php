<?php

namespace App\Filament\Admin\Resources\Anggotas;

use App\Filament\Admin\Resources\Anggotas\Pages\CreateAnggota;
use App\Filament\Admin\Resources\Anggotas\Pages\EditAnggota;
use App\Filament\Admin\Resources\Anggotas\Pages\ListAnggotas;
use App\Filament\Admin\Resources\Anggotas\Schemas\AnggotaForm;
use App\Filament\Admin\Resources\Anggotas\Tables\AnggotasTable;
use App\Models\Anggota;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class AnggotaResource extends Resource
{
    protected static ?string $model = Anggota::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-user-group';

    protected static ?string $navigationLabel = 'Anggota';

    protected static ?string $modelLabel = 'Anggota';

    protected static ?string $pluralModelLabel = 'Data Anggota';

    protected static ?int $navigationSort = 1;

    protected static ?string $recordTitleAttribute = 'nama';

    public static function form(Schema $schema): Schema
    {
        return AnggotaForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return AnggotasTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListAnggotas::route('/'),
            'create' => CreateAnggota::route('/create'),
            'edit' => EditAnggota::route('/{record}/edit'),
        ];
    }
}

<?php

namespace App\Filament\Admin\Resources\Simpanans;

use App\Filament\Admin\Resources\Simpanans\Pages\ManageSimpanans;
use App\Models\Simpanan;
use BackedEnum;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class SimpananResource extends Resource
{
    protected static ?string $model = Simpanan::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-currency-dollar';

    protected static ?string $navigationLabel = 'Simpanan';

    protected static ?string $modelLabel = 'Simpanan';

    protected static ?string $pluralModelLabel = 'Data Simpanan';

    protected static ?int $navigationSort = 3;

    protected static ?string $recordTitleAttribute = 'id';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                DateTimePicker::make('tgl_transaksi')
                    ->required(),
                TextInput::make('anggota_id')
                    ->required()
                    ->numeric(),
                TextInput::make('jenis_id')
                    ->required()
                    ->numeric(),
                TextInput::make('jumlah')
                    ->required()
                    ->numeric(),
                TextInput::make('keterangan')
                    ->required(),
                Select::make('akun')
                    ->options(['Setoran' => 'Setoran', 'Penarikan' => 'Penarikan'])
                    ->required(),
                Select::make('dk')
                    ->options(['D' => 'D', 'K' => 'K'])
                    ->required(),
                TextInput::make('kas_id')
                    ->required()
                    ->numeric(),
                DateTimePicker::make('update_data'),
                TextInput::make('user_name')
                    ->required(),
                TextInput::make('nama_penyetor')
                    ->required(),
                TextInput::make('no_identitas')
                    ->required(),
                TextInput::make('alamat')
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('Simpanan')
            ->columns([
                TextColumn::make('tgl_transaksi')
                    ->dateTime()
                    ->sortable(),
                TextColumn::make('anggota_id')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('jenis_id')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('jumlah')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('keterangan')
                    ->searchable(),
                TextColumn::make('akun'),
                TextColumn::make('dk'),
                TextColumn::make('kas_id')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('update_data')
                    ->dateTime()
                    ->sortable(),
                TextColumn::make('user_name')
                    ->searchable(),
                TextColumn::make('nama_penyetor')
                    ->searchable(),
                TextColumn::make('no_identitas')
                    ->searchable(),
                TextColumn::make('alamat')
                    ->searchable(),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => ManageSimpanans::route('/'),
        ];
    }
}

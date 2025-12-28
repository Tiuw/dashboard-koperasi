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
                Select::make('anggota_id')
                    ->relationship('anggota', 'nama')
                    ->searchable()
                    ->preload()
                    ->required()
                    ->label('Nama Anggota'),
                Select::make('jenis_id')
                    ->relationship('jenis', 'nama_jenis')
                    ->searchable()
                    ->preload()
                    ->required()
                    ->label('Jenis Simpanan'),
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
                Select::make('kas_id')
                    ->relationship('kas', 'nama_kas')
                    ->searchable()
                    ->preload()
                    ->required()
                    ->label('Kas'),
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
                TextColumn::make('anggota.nama')
                    ->label('Nama Anggota')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('jenis.nama_jenis')
                    ->label('Jenis Simpanan')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('jumlah')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('keterangan')
                    ->searchable(),
                TextColumn::make('akun'),
                TextColumn::make('dk'),
                TextColumn::make('kas.nama_kas')
                    ->label('Kas')
                    ->searchable()
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

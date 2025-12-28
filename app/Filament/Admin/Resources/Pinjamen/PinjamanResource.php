<?php

namespace App\Filament\Admin\Resources\Pinjamen;

use App\Filament\Admin\Resources\Pinjamen\Pages\ManagePinjamen;
use App\Models\Pinjaman;
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

class PinjamanResource extends Resource
{
    protected static ?string $model = Pinjaman::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-banknotes';

    protected static ?string $navigationLabel = 'Pinjaman';

    protected static ?string $modelLabel = 'Pinjaman';

    protected static ?string $pluralModelLabel = 'Data Pinjaman';

    protected static ?int $navigationSort = 2;

    protected static ?string $recordTitleAttribute = 'id';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                DateTimePicker::make('tgl_pinjam')
                    ->required(),
                Select::make('anggota_id')
                    ->relationship('anggota', 'nama')
                    ->searchable()
                    ->preload()
                    ->required()
                    ->label('Nama Anggota'),
                Select::make('barang_id')
                    ->relationship('barang', 'nm_barang')
                    ->searchable()
                    ->preload()
                    ->required()
                    ->label('Nama Barang'),
                TextInput::make('lama_angsuran')
                    ->required()
                    ->numeric(),
                TextInput::make('jml_barang')
                    ->required()
                    ->numeric()
                    ->default(1),
                TextInput::make('harga_satuan')
                    ->required()
                    ->numeric(),
                TextInput::make('jumlah')
                    ->required()
                    ->numeric(),
                TextInput::make('bunga')
                    ->required()
                    ->numeric(),
                TextInput::make('biaya_adm')
                    ->required()
                    ->numeric(),
                Select::make('lunas')
                    ->options(['Belum' => 'Belum', 'Lunas' => 'Lunas'])
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
                Select::make('jns_trans')
                    ->options([
                        1 => 'Pinjaman',
                        2 => 'Pelunasan Pinjaman',
                        3 => 'Setoran Simpanan',
                    ])
                    ->required()
                    ->label('Jenis Transaksi'),
                DateTimePicker::make('update_data'),
                TextInput::make('user_name')
                    ->required(),
                TextInput::make('keterangan')
                    ->required(),
                TextInput::make('contoh')
                    ->numeric(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('Pinjaman')
            ->columns([
                TextColumn::make('tgl_pinjam')
                    ->dateTime()
                    ->sortable(),
                TextColumn::make('anggota.nama')
                    ->label('Nama Anggota')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('barang.nm_barang')
                    ->label('Nama Barang')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('lama_angsuran')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('jml_barang')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('harga_satuan')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('jumlah')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('bunga')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('biaya_adm')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('lunas'),
                TextColumn::make('dk'),
                TextColumn::make('kas.nama_kas')
                    ->label('Kas')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('jns_trans')
                    ->label('Jenis Transaksi')
                    ->formatStateUsing(fn ($state) => match($state) {
                        1 => 'Pinjaman',
                        2 => 'Pelunasan Pinjaman',
                        3 => 'Setoran Simpanan',
                        default => $state
                    })
                    ->sortable(),
                TextColumn::make('update_data')
                    ->dateTime()
                    ->sortable(),
                TextColumn::make('user_name')
                    ->searchable(),
                TextColumn::make('keterangan')
                    ->searchable(),
                TextColumn::make('contoh')
                    ->numeric()
                    ->sortable(),
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
            'index' => ManagePinjamen::route('/'),
        ];
    }
}

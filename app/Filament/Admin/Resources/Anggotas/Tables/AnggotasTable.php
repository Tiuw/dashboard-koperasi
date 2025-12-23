<?php

namespace App\Filament\Admin\Resources\Anggotas\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class AnggotasTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nama')
                    ->searchable(),
                TextColumn::make('identitas')
                    ->searchable(),
                TextColumn::make('jk'),
                TextColumn::make('tmp_lahir')
                    ->searchable(),
                TextColumn::make('tgl_lahir')
                    ->date()
                    ->sortable(),
                TextColumn::make('status')
                    ->searchable(),
                TextColumn::make('agama')
                    ->searchable(),
                TextColumn::make('departement')
                    ->searchable(),
                TextColumn::make('pekerjaan')
                    ->searchable(),
                TextColumn::make('kota')
                    ->searchable(),
                TextColumn::make('notelp')
                    ->searchable(),
                TextColumn::make('tgl_daftar')
                    ->date()
                    ->sortable(),
                TextColumn::make('jabatan_id')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('aktif'),
                TextColumn::make('tanggal_keluar')
                    ->date()
                    ->sortable(),
                TextColumn::make('pass_word')
                    ->searchable(),
                TextColumn::make('file_pic')
                    ->searchable(),
                TextColumn::make('tanggal_update')
                    ->dateTime()
                    ->sortable(),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                EditAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}

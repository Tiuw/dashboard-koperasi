<?php

namespace App\Filament\Admin\Resources\Anggotas\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Schema;

class AnggotaForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nama')
                    ->required(),
                TextInput::make('identitas')
                    ->required(),
                Select::make('jk')
                    ->options(['L' => 'L', 'P' => 'P'])
                    ->required(),
                TextInput::make('tmp_lahir')
                    ->required(),
                DatePicker::make('tgl_lahir')
                    ->required(),
                TextInput::make('status')
                    ->required(),
                TextInput::make('agama')
                    ->required(),
                TextInput::make('departement')
                    ->required(),
                TextInput::make('pekerjaan')
                    ->required(),
                Textarea::make('alamat')
                    ->required()
                    ->columnSpanFull(),
                TextInput::make('kota')
                    ->required(),
                TextInput::make('notelp')
                    ->tel()
                    ->required(),
                DatePicker::make('tgl_daftar')
                    ->required(),
                TextInput::make('jabatan_id')
                    ->required()
                    ->numeric(),
                Select::make('aktif')
                    ->options(['Y' => 'Y', 'N' => 'N'])
                    ->required(),
                DatePicker::make('tanggal_keluar'),
                TextInput::make('pass_word')
                    ->required(),
                TextInput::make('file_pic')
                    ->required(),
                TextInput::make('password2')
                    ->password(),
                DateTimePicker::make('tanggal_update')
                    ->required(),
            ]);
    }
}

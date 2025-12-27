# Dashboard Koperasi

Dashboard manajemen koperasi berbasis web yang dibangun menggunakan Laravel dan Filament. Aplikasi ini dirancang untuk membantu pengelolaan koperasi dengan fitur manajemen anggota, simpanan, dan pinjaman.

## ✨ Fitur

- 📊 **Dashboard Admin** - Panel administrasi yang intuitif dengan Filament
- 👥 **Manajemen Anggota** - Kelola data anggota koperasi
- 💰 **Manajemen Simpanan** - Pencatatan dan monitoring simpanan anggota
- 🏦 **Manajemen Pinjaman** - Pengelolaan pinjaman anggota
- 🔐 **Autentikasi & Otorisasi** - Sistem keamanan berbasis role
- 📈 **Laporan & Statistik** - Dashboard interaktif dengan widgets

## 🛠️ Tech Stack

- **Framework**: Laravel 12.x
- **Admin Panel**: Filament 4.0
- **PHP**: ^8.2
- **Database**: MySQL/PostgreSQL
- **Frontend**: Blade, Livewire, Alpine.js, Tailwind CSS

## 📋 Prasyarat

Pastikan sistem Anda telah terinstall:

- PHP 8.2 atau lebih tinggi
- Composer
- Node.js & NPM
- MySQL/PostgreSQL
- Web Server (Apache/Nginx)

## 🚀 Instalasi

### 1. Clone Repository

```bash
git clone <repository-url>
cd dashboard-koperasi
```

### 2. Install Dependencies

```bash
# Install PHP dependencies
composer install

# Install Node dependencies
npm install
```

### 3. Konfigurasi Environment

```bash
# Copy file environment
cp .env.example .env

# Generate application key
php artisan key:generate
```

### 4. Konfigurasi Database

Edit file `.env` dan sesuaikan konfigurasi database sesuai dengan environment Anda.

### 5. Import Database

```bash
# Import skema database (jika tersedia)
# mysql -u root -p dashboard_koperasi < temprin2_erp_tsm-skema.sql

# Atau jalankan migrasi
php artisan migrate
```

### 6. Seed Database (Opsional)

```bash
php artisan db:seed
```

### 7. Build Assets

```bash
npm run build
# Atau untuk development
npm run dev
```

### 8. Buat Storage Link

```bash
php artisan storage:link
```

### 9. Buat Admin User Filament

```bash
php artisan make:filament-user
```

Ikuti prompt untuk membuat user admin pertama Anda.

### 10. Jalankan Aplikasi

```bash
php artisan serve
```

Akses aplikasi di `http://localhost:8000`

## 👤 Login Admin

Setelah seeding, Anda dapat login menggunakan kredensial yang telah dibuat. Pastikan untuk mengubah password default setelah login pertama kali untuk keamanan.

## 🎨 Filament Admin Panel

### Akses Admin Panel

Admin panel Filament dapat diakses melalui:
- URL: `http://localhost:8000/admin`
- Login menggunakan user yang dibuat dengan `php artisan make:filament-user`

### Struktur Filament

```
app/Filament/
├── Admin/              # Panel konfigurasi
├── Pages/              # Custom pages
└── Widgets/            # Dashboard widgets
```

### Membuat Resource Baru

```bash
# Buat resource lengkap dengan form & table
php artisan make:filament-resource NamaModel

# Dengan generate otomatis
php artisan make:filament-resource NamaModel --generate

# Dengan view page
php artisan make:filament-resource NamaModel --view
```

### Membuat Custom Page

```bash
# Page biasa
php artisan make:filament-page NamaPage

# Page dengan resource
php artisan make:filament-page ManageSettings --resource=SettingResource --type=ManageRecords
```

### Membuat Widget

```bash
# Stats widget
php artisan make:filament-widget StatsOverview --stats-overview

# Chart widget
php artisan make:filament-widget BlogPostsChart --chart

# Table widget
php artisan make:filament-widget LatestOrders --table
```

### Konfigurasi Panel

Panel Filament dikonfigurasi di `app/Providers/Filament/AdminPanelProvider.php`:

```php
$panel
    ->id('admin')
    ->path('admin')
    ->login()
    ->colors([
        'primary' => Color::Amber,
    ])
    ->discoverResources()
    ->discoverPages()
    ->discoverWidgets();
```

### Fitur Filament Yang Digunakan

- **Resources**: CRUD management untuk Anggota, Simpanan, dan Pinjaman
- **Forms**: Form builder dengan validasi
- **Tables**: Table builder dengan filter, search, dan actions
- **Widgets**: Dashboard widgets untuk statistik
- **Notifications**: Toast notifications untuk feedback
- **Actions**: Bulk actions dan custom actions
- **Relations**: Relationship management
- **Import/Export**: Data import dan export

### Tips Development Filament

1. **Clear Cache**: Setelah membuat resource baru, clear cache:
   ```bash
   php artisan filament:optimize
   ```

2. **Asset Rebuild**: Jika styling tidak muncul:
   ```bash
   php artisan filament:assets
   npm run build
   ```

3. **Upgrade Filament**:
   ```bash
   php artisan filament:upgrade
   ```

### Resources Filament

- 📚 [Dokumentasi Resmi](https://filamentphp.com/docs)
- 🎓 [Video Tutorial](https://www.youtube.com/@filamentphp)
- 💬 [Discord Community](https://filamentphp.com/discord)
- 🐙 [GitHub](https://github.com/filamentphp/filament)
- 📦 [Plugin Directory](https://filamentphp.com/plugins)

## 📁 Struktur Project

```
├── app/
│   ├── Filament/          # Konfigurasi Filament Admin Panel
│   ├── Http/Controllers/  # Controllers
│   ├── Models/            # Eloquent Models
│   │   ├── Anggota.php   # Model Anggota
│   │   ├── Simpanan.php  # Model Simpanan
│   │   └── Pinjaman.php  # Model Pinjaman
│   └── Providers/         # Service Providers
├── database/
│   ├── factories/         # Model Factories
│   ├── migrations/        # Database Migrations
│   └── seeders/          # Database Seeders
├── resources/
│   ├── css/              # Stylesheets
│   ├── js/               # JavaScript
│   └── views/            # Blade Templates
└── routes/               # Route Definitions
```

## 🔧 Penggunaan

### Akses Admin Panel

1. Buka browser dan akses `http://localhost:8000/admin`
2. Login menggunakan kredensial admin yang telah dibuat
3. Kelola data melalui sidebar menu

### Fitur-Fitur Admin Panel

#### Dashboard
- Overview statistik koperasi
- Widget informasi anggota, simpanan, dan pinjaman
- Grafik dan chart interaktif

#### Manajemen Anggota
- **Create**: Tambah anggota baru dengan form lengkap
- **Read**: Lihat daftar anggota dengan search dan filter
- **Update**: Edit data anggota existing
- **Delete**: Hapus anggota (dengan soft delete)
- **Export**: Export data ke Excel/CSV
- **Import**: Import data anggota bulk

#### Manajemen Simpanan
- Catat transaksi simpanan (wajib, pokok, sukarela)
- Lihat history simpanan per anggota
- Filter berdasarkan tanggal dan jenis simpanan
- Laporan total simpanan

#### Manajemen Pinjaman
- Ajukan pinjaman baru
- Tracking status pinjaman (pending, approved, rejected)
- Catat pembayaran angsuran
- Kalkulasi otomatis bunga dan cicilan
- Notifikasi pembayaran jatuh tempo

### Navigasi Cepat

- **Pencarian Global**: Tekan `Ctrl+K` atau `Cmd+K`
- **Dark Mode**: Toggle di pojok kanan atas
- **Profile Menu**: Akses pengaturan akun dan logout
- **Breadcrumbs**: Navigasi cepat antar halaman

## 🧪 Testing

```bash
# Jalankan semua test
php artisan test

# Atau menggunakan PHPUnit
vendor/bin/phpunit
```

## 📝 Development

### Menjalankan Development Server

```bash
# Terminal 1: Laravel development server
php artisan serve

# Terminal 2: Vite development server
npm run dev
```

### Code Style

```bash
# Format code menggunakan Laravel Pint
./vendor/bin/pint
```

## 🔒 Keamanan

Jika Anda menemukan kerentanan keamanan, silakan kirim email ke [your-email@example.com].

## 📄 License

Aplikasi ini adalah open-source software berlisensi [MIT license](https://opensource.org/licenses/MIT).

## 👨‍💻 Developer

Dikembangkan sebagai bagian dari program PKL (Praktik Kerja Lapangan).

---

**Note**: Pastikan untuk mengubah semua konfigurasi default dan kredensial sebelum deploy ke production!

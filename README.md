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

### 9. Jalankan Aplikasi

```bash
php artisan serve
```

Akses aplikasi di `http://localhost:8000`

## 👤 Login Admin

Setelah seeding, Anda dapat login menggunakan kredensial yang telah dibuat. Pastikan untuk mengubah password default setelah login pertama kali untuk keamanan.

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

1. Buka browser dan akses `/admin`
2. Login menggunakan kredensial admin
3. Kelola data melalui menu yang tersedia

### Manajemen Data

- **Anggota**: Tambah, edit, hapus, dan lihat detail anggota koperasi
- **Simpanan**: Catat transaksi simpanan anggota
- **Pinjaman**: Kelola pengajuan dan pembayaran pinjaman

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

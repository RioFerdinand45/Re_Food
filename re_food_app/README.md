# Re-Food

Re-Food adalah prototipe aplikasi Flutter untuk mengurangi limbah pangan dengan menghubungkan makanan berlebih yang masih layak konsumsi kepada orang yang membutuhkan.

Project ini saat ini merupakan aplikasi UI/interaksi lokal dengan data contoh dan belum terhubung ke backend.

## Fitur

- Splash screen dan onboarding
- Login dan registrasi dengan validasi sederhana
- Beranda dengan lokasi contoh, kategori, dan rekomendasi makanan
- Jelajahi makanan beserta pencarian dan filter kategori
- Detail makanan, deskripsi, harga, lokasi, serta informasi pengambilan
- Form publikasi donasi makanan beserta pemilihan tanggal kedaluwarsa
- Tab aktivitas untuk pesanan dan donasi
- Profil pengguna serta pilihan menu akun
- Navigasi utama menggunakan Material 3 `NavigationBar`

## Status Implementasi

Fitur berikut masih berupa simulasi:

- Autentikasi dan pemulihan kata sandi
- Login Google
- Penyimpanan pesanan dan donasi
- Unggah foto makanan
- Lokasi berbasis GPS dan peta
- Pembayaran
- Backend, database, serta sinkronisasi data

Data makanan dan pengguna pada aplikasi bersifat statis atau dikelola di memori.

## Teknologi

- Flutter
- Dart SDK `>=3.3.0 <4.0.0`
- Material 3
- `flutter_lints`
- Asset gambar lokal

Tidak diperlukan package pihak ketiga tambahan selain Flutter SDK dan dependency yang tercantum pada `pubspec.yaml`.

## Persyaratan

- Flutter SDK dengan dukungan Dart SDK `3.3` atau lebih baru
- Android Studio atau VS Code dengan extension Flutter
- Android SDK dan emulator, atau perangkat Android
- Chrome jika ingin menjalankan versi web

## Instalasi

1. Masuk ke direktori project:

   ```bash
   cd re_food_app
   ```

2. Unduh dependency:

   ```bash
   flutter pub get
   ```

3. Pastikan emulator atau perangkat sudah tersedia:

   ```bash
   flutter devices
   ```

4. Jalankan aplikasi:

   ```bash
   flutter run
   ```

## Menjalankan pada Platform Tertentu

Android:

```bash
flutter run -d android
```

Web:

```bash
flutter run -d chrome
```

Windows:

```bash
flutter run -d windows
```

## Pengujian dan Analisis

Menjalankan widget test:

```bash
flutter test
```

Menjalankan analisis kode:

```bash
flutter analyze
```

## Struktur Project

```text
re_food_app/
├── assets/
│   └── images/
│       ├── bread.png
│       ├── fruit.png
│       ├── meal.png
│       ├── refood_logo.png
│       └── vegetables.png
├── lib/
│   └── main.dart
├── test/
│   └── widget_test.dart
├── analysis_options.yaml
├── pubspec.yaml
└── README.md
```

Seluruh tampilan dan logika prototipe saat ini berada dalam `lib/main.dart`.

## Catatan Pengembangan

- Proyek menggunakan nama package `re_food`.
- Logo dan ilustrasi makanan dimuat dari `assets/images/`.
- Aplikasi dapat dikembangkan menjadi versi penuh dengan menambahkan state management, API, autentikasi, penyimpanan data, service lokasi, serta layanan upload gambar.

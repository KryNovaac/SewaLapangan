# 🏟️ Sewa Lapangan - Aplikasi Booking Lapangan Olahraga Mobile

---

## 🚀 Overview

**Sewa Lapangan** adalah aplikasi mobile yang dibangun menggunakan **Flutter** yang dirancang untuk menyederhanakan proses pencarian, penyaringan, dan pemesanan berbagai lapangan olahraga. Mulai dari **futsal, basket, bulutangkis, tenis, hingga voli**, Anda dapat menemukan dan memesan lapangan yang paling sesuai berdasarkan lokasi, harga, rating, dan ketersediaan, semuanya dalam pengalaman pengguna yang mulus.

### Target Pengguna

* Pecinta olahraga yang mencari kemudahan dalam booking lapangan.
* Pemilik fasilitas olahraga yang ingin menjangkau lebih banyak pelanggan.

---

## ✨ Features

Aplikasi ini hadir dengan serangkaian fitur untuk memastikan proses booking yang efisien:

| Fitur | Deskripsi |
| :--- | :--- |
| **Listing Lapangan** | Jelajahi berbagai lapangan dengan detail seperti nama, lokasi, jenis permukaan, harga, dan rating. |
| **Pencarian & Filter** | Cari lapangan berdasarkan nama atau lokasi, dan filter berdasarkan kriteria: **Terbaru**, **Terlama**, **Termurah**, **Termahal**, atau **Rating Terbaik**. |
| **Proses Booking** | Pilih lapangan, tentukan durasi, dan lanjutkan ke pembayaran. |
| **Integrasi Pembayaran** | Mendukung pembayaran **Tunai di Tempat** dan pembayaran digital melalui **QRIS** (Kode QR yang dapat dipindai). |
| **Konfirmasi Sukses** | Halaman konfirmasi instan dengan detail booking dan opsi untuk mengunduh **Struk/Resi**. |
| **Riwayat Booking** | Lacak semua booking masa lalu melalui halaman Riwayat yang berdedikasi. |

---

## 🛠️ Prerequisites

Pastikan Anda memiliki hal-hal berikut sebelum memulai instalasi:

* **Flutter SDK**: Versi **3.x** atau lebih tinggi direkomendasikan.
    * [Instal Flutter](https://docs.flutter.dev/get-started/install)
* **Dart**: Sudah termasuk dalam instalasi Flutter.
* **IDE**: **Android Studio** atau **VS Code** dengan dukungan Flutter.

### Dependencies Utama

Pastikan file `pubspec.yaml` Anda menyertakan paket-paket berikut:

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.3.2 
  # (Opsional, untuk kustomisasi font)
  qr_flutter: ^4.1.0 
  # (Opsional, untuk menampilkan Kode QRIS)

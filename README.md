<div align="center">

<img src="header.svg" alt="MARIE" width="100%"/>

<br/>

![Pascal](https://img.shields.io/badge/Bahasa-Pascal-0f766e?style=for-the-badge)
![Free Pascal](https://img.shields.io/badge/Compiler-Free%20Pascal-14b8a6?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Konsol-facc15?style=for-the-badge&labelColor=444)
![Kelompok](https://img.shields.io/badge/Kelompok-Musketeers-e11d48?style=for-the-badge)

</div>

---

## 📖 Deskripsi Singkat

Banyak masyarakat, khususnya **mahasiswa**, masih kesulitan mengelola uang. Uang saku atau pemasukan bulanan sering habis sebelum waktunya karena tidak dicatat, tidak dibagi sesuai kebutuhan, dan tidak ada uang yang disisihkan untuk tabungan maupun dana darurat. Masalah ini diperparah oleh **rendahnya literasi keuangan**, sehingga banyak orang belum mengenal cara dasar membagi pemasukan, membedakan kebutuhan dan keinginan, atau bahaya utang konsumtif dan pinjaman online ilegal.

**MARIE** dibuat sebagai alat bantu sederhana untuk mengatasi masalah tersebut. Nama MARIE terinspirasi dari nama Menteri Keuangan kita, sebagai simbol pengelolaan keuangan yang tertata. Nama ini sekaligus singkatan dari lima kata yang menggambarkan isi program:

<div align="center">

| | Huruf | Arti | Fungsi |
|:-:|:-:|---|---|
| 💵 | **M** | **Money** | Uang pengguna sebagai pusat pengelolaan, mulai dari pemasukan sampai pengeluaran |
| 💸 | **A** | **Allocation** | Membagi uang ke beberapa *pocket* sesuai tujuan |
| 📏 | **R** | **Regulation** | Mengatur dan mencatat pemasukan serta pengeluaran |
| 💡 | **I** | **Insight** | Memberi gambaran kondisi keuangan dan saran dari literatur keuangan |
| 📊 | **E** | **Evaluation** | Menilai kesehatan keuangan dari perbandingan pemasukan dan pengeluaran |

</div>

> [!TIP]
> Dengan MARIE, pengguna diharapkan terbiasa mencatat keuangan, membagi uang sejak pemasukan diterima, dan memahami dasar-dasar literasi keuangan.

---

## 👥 Anggota Kelompok

<div align="center">

### ⚔️ Musketeers ⚔️

| No | Nama | NIM | KOM | Lab |
|:-:|---|:-:|:-:|:-:|
| 1 | **Zafran Ali Ihsan Nasution** | `261401071` | A | Lab 1 |
| 2 | **M. Faizul Khairi Rangkuti** | `261401026` | A | Lab 1 |
| 3 | **Glen Neal Samaano Ondroita Zamili** | `261401114` | A | Lab 2 |

</div>

---

## ✨ Fitur Utama dan Logika Singkat

### 🔐 1. Login
Pengguna harus memasukkan username dan sandi sebelum masuk ke program. Kesempatan login hanya **3 kali**. Kalau salah 3 kali, akun terkunci. Username atau sandi yang kosong tidak dihitung sebagai percobaan.

<details>
<summary>⚙️ <b>Lihat logika</b></summary>

Perulangan `repeat ... until` dengan penghitung `percobaan`. `continue` dipakai saat input kosong, dan `break` dipakai saat login berhasil.
</details>

### 🧾 2. Ringkasan Rekening
Menampilkan daftar pocket beserta saldo dan persennya, saldo di luar pocket, total saldo, total pemasukan, total pengeluaran, dan jumlah transaksi.

<details>
<summary>⚙️ <b>Lihat logika</b></summary>

Total saldo dihitung dengan menjumlahkan saldo di luar pocket dan saldo setiap pocket menggunakan perulangan `for`.
</details>

### 💰 3. Input Pemasukan
Pengguna memasukkan nominal pemasukan, lalu memilih cara penyimpanannya:

| Pilihan | Keterangan |
|:-:|---|
| **1** | 📐 **Pakai template persen:** uang dibagi otomatis sesuai persen tiap pocket |
| **2** | ✍️ **Atur nominal sendiri:** pengguna menentukan nominal untuk tiap pocket |
| **3** | 🗃️ **Tidak dimasukkan ke pocket:** uang masuk ke saldo di luar pocket |

Kalau belum punya pocket, program meminta pengguna membuat pocket dulu (1 sampai 8) dan memberi namanya. Kalau template belum diatur, program meminta pengguna mengatur persennya.

<details>
<summary>⚙️ <b>Lihat logika</b></summary>

Bagian tiap pocket = `nominal div 100 * persen`. Sisa uang yang tidak terbagi, misalnya karena total persen kurang dari 100% atau hasil pembulatan, otomatis masuk ke saldo di luar pocket.
</details>

### 🛒 4. Input Pengeluaran
Pengguna memilih sumber uang (pocket tertentu atau saldo di luar pocket), lalu memasukkan nominal pengeluaran.

<details>
<summary>⚙️ <b>Lihat logika</b></summary>

Pengeluaran hanya dicatat kalau saldo sumbernya cukup. Kalau tidak cukup, nominal tidak valid, atau nomor pocket tidak ada, procedure langsung berhenti menggunakan `exit`.
</details>

### 👛 5. Kelola Pocket
- ➕ **Tambah pocket**, maksimal 8 pocket
- ✏️ **Ganti nama pocket**
- 📐 **Atur template persen**, total semua pocket maksimal 100%
- 🗑️ **Hapus pocket**: saldonya dipindah ke saldo di luar pocket, dan pocket di belakangnya digeser maju satu nomor

<details>
<summary>⚙️ <b>Lihat logika</b></summary>

Karena tidak memakai array, setiap pocket disimpan dalam variabel sendiri (`nama1`–`nama8`, `saldo1`–`saldo8`, `persen1`–`persen8`). Procedure `ambilPocket` dan `simpanPocket` memakai `case` untuk mengambil atau menyimpan data pocket berdasarkan nomornya. Setiap kali jumlah pocket berubah, template persen direset supaya pembagiannya tidak salah.
</details>

### 📊 6. Analisis Keuangan
Menampilkan persentase pengeluaran dan sisa uang dari total pemasukan, beserta statusnya:

<div align="center">

| Status | Sisa Uang |
|:-:|:-:|
| 🟢 **SEHAT** | 20% atau lebih |
| 🟡 **CUKUP** | 10% – 19% |
| 🔴 **WASPADA** | di bawah 10% |

</div>

Tersedia juga menu **saran keuangan** berdasarkan literatur keuangan dan teori ekonomi:

| No | Topik | Isi |
|:-:|---|---|
| 1 | 🧮 Cara membagi uang | Aturan 50/30/20 dan 40/30/20/10, beserta hitungan ideal dari pemasukan pengguna |
| 2 | 📥 Mengatur pemasukan | Menyisihkan uang di awal (*The Richest Man in Babylon*) dan Hukum Parkinson |
| 3 | 📤 Mengendalikan pengeluaran | Kebutuhan dan keinginan, belanja impulsif, Hukum Engel |
| 4 | 🛟 Dana darurat | Besar dana darurat ideal dan pengecekan apakah saldo pengguna sudah cukup |
| 5 | 💳 Utang dan cicilan | Batas cicilan 30%, utang produktif dan konsumtif, bahaya pinjol ilegal |
| 6 | 📈 Menabung dan investasi | Inflasi, nilai waktu uang, prinsip 2L (Legal dan Logis) dari OJK |

<details>
<summary>⚙️ <b>Lihat logika</b></summary>

Rasio dihitung dengan tipe `real`, lalu status ditentukan dengan `if-else`. Setiap topik saran dibuat sebagai procedure terpisah.
</details>

### 🔑 7. Ganti Sandi
Pengguna harus memasukkan sandi lama, lalu sandi baru dua kali sebagai konfirmasi. Sandi baru tidak boleh kosong.

### ♻️ 8. Reset Data
Menghapus semua data keuangan (pocket, saldo, pemasukan, pengeluaran, dan transaksi) supaya pengguna bisa mulai dari awal. Username dan sandi tidak ikut terhapus.

<details>
<summary>⚙️ <b>Lihat logika</b></summary>

Untuk mencegah reset tanpa sengaja, pengguna harus memasukkan sandi dan mengetik `RESET`. Kalau salah satunya tidak sesuai, reset dibatalkan dengan `exit`.
</details>

### 💾 9. Penyimpanan Data Otomatis
Semua data disimpan ke file `marie.txt`, jadi data tidak hilang walaupun program ditutup.

<details>
<summary>⚙️ <b>Lihat logika</b></summary>

- `simpanData` menulis data ke file setiap kali satu menu selesai (`assign`, `rewrite`, `writeln`, `close`)
- `bacaData` membaca file saat program dibuka (`assign`, `reset`, `readln`, `close`)
- `FileExists` mengecek apakah file sudah ada, supaya program tidak error saat pertama kali dijalankan
</details>

---

## 🚀 Panduan Penggunaan

### 🧰 Kebutuhan
- [Free Pascal Compiler](https://www.freepascal.org/), atau IDE seperti Lazarus / Free Pascal IDE
- Windows, Linux, atau macOS

### ▶️ Cara Menjalankan
1. Clone atau download repositori ini.
2. Buka terminal di folder project, lalu compile:
   ```bash
   fpc ProjekMARIE.pas
   ```
3. Jalankan program:
   - Windows: `ProjekMARIE.exe`
   - Linux/macOS: `./ProjekMARIE`

Program juga bisa dijalankan langsung dari VS Code atau Free Pascal IDE.

### 🔓 Akun Awal

| 👤 Username | 🔑 Sandi |
|:-:|:-:|
| `admin` | `1234` |

> [!NOTE]
> Sandi bisa diganti lewat menu **6. Ganti Sandi**.

### 🧭 Contoh Alur Pemakaian
1. **Login** dengan username `admin` dan sandi `1234`.
2. Pilih **2. Input Pemasukan**, lalu masukkan nominal, misalnya `1000000`.
3. Pilih **1** (pakai template persen).
4. Karena belum punya pocket, buat dulu. Contoh: 3 pocket bernama `Makan`, `Transport`, dan `Tabungan`.
5. Atur persen setiap pocket. Contoh: Makan `50`, Transport `30`, Tabungan `20`.
6. Uang otomatis terbagi: 🍜 Makan **Rp 500.000**, 🚌 Transport **Rp 300.000**, 🏦 Tabungan **Rp 200.000**.
7. Saat ada pengeluaran, pilih **3. Input Pengeluaran**, pilih pocket sumbernya, lalu masukkan nominalnya.
8. Lihat kondisi keuangan di **1. Ringkasan Rekening** dan **5. Analisis Keuangan**.
9. Pilih **0. Keluar** untuk menutup program. Data tetap tersimpan untuk pemakaian berikutnya.

### 📋 Menu Utama

| Menu | Fungsi |
|:-:|---|
| `1` | 🧾 Ringkasan Rekening |
| `2` | 💰 Input Pemasukan |
| `3` | 🛒 Input Pengeluaran |
| `4` | 👛 Kelola Pocket |
| `5` | 📊 Analisis Keuangan dan Saran |
| `6` | 🔑 Ganti Sandi |
| `7` | ♻️ Reset Data |
| `0` | 🚪 Keluar |

---

## 📁 Struktur File

```
📦 TugasPascal
 ┣ 📜 ProjekMARIE.pas   → source code program
 ┣ 📄 marie.txt         → penyimpanan data (dibuat otomatis)
 ┣ 📘 README.md         → dokumentasi repositori
 ┗ 🖼️ header.svg        → banner animasi README
```

---

## 📌 Catatan

> [!IMPORTANT]
> - Jumlah pocket maksimal **8**.
> - Nominal uang memakai tipe `longint`, jadi batas maksimalnya sekitar **Rp 2,1 miliar**.

> [!WARNING]
> - Jangan mengedit `marie.txt` secara manual, karena urutan barisnya harus sesuai dengan yang dibaca program.
> - Hapus `marie.txt` kalau ingin mengembalikan program ke kondisi awal, termasuk sandi kembali menjadi `1234`.

---

<div align="center">

**Dibuat oleh ⚔️ Musketeers · KOM A**

</div>
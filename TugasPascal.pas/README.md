# MARIE
### Money Allocation, Regulation, Insight & Evaluation

Program pengelola keuangan pribadi berbasis konsol yang dibuat dengan bahasa Pascal.

---

## Deskripsi Singkat

Banyak masyarakat, khususnya mahasiswa, masih kesulitan mengelola uang. Uang saku atau pemasukan bulanan sering habis sebelum waktunya karena tidak dicatat, tidak dibagi sesuai kebutuhan, dan tidak ada uang yang disisihkan untuk tabungan maupun dana darurat. Masalah ini diperparah oleh rendahnya literasi keuangan, sehingga banyak orang belum mengenal cara dasar membagi pemasukan, membedakan kebutuhan dan keinginan, atau bahaya utang konsumtif dan pinjaman online ilegal.

**MARIE** dibuat sebagai alat bantu sederhana untuk mengatasi masalah tersebut. Nama MARIE terinspirasi dari nama Menteri Keuangan kita, sebagai simbol pengelolaan keuangan yang tertata. Nama ini sekaligus singkatan dari empat fungsi utama program:

- **Money Allocation:** membagi uang ke beberapa *pocket* (kantong) sesuai tujuan, misalnya makan, transport, dan tabungan.
- **Regulation:** mengatur dan mencatat setiap pemasukan dan pengeluaran supaya tidak melebihi saldo yang ada.
- **Insight:** memberi gambaran kondisi keuangan pengguna dan saran pengelolaan uang berdasarkan literatur keuangan.
- **Evaluation:** menilai kesehatan keuangan pengguna dari perbandingan pemasukan dan pengeluaran.

Dengan MARIE, pengguna diharapkan terbiasa mencatat keuangan, membagi uang sejak awal pemasukan diterima, dan memahami dasar-dasar literasi keuangan.

---

## Anggota Kelompok

**Nama Kelompok: Musketeers**

| No | Nama | NIM | KOM | Lab |
|----|------|-----|-----|-----|
| 1 | Zafran Ali Ihsan Nasution | 261401071 | A | Lab 1 |
| 2 | M. Faizul Khairi Rangkuti | 261401026 | A | Lab 1 |
| 3 | Glen Neal Samaano Ondroita Zamili | 261401114 | A | Lab 2 |

---

## Fitur Utama dan Logika Singkat

### 1. Login
Pengguna harus memasukkan username dan sandi sebelum masuk ke program. Kesempatan login hanya 3 kali. Kalau salah 3 kali, akun terkunci dan program berhenti. Username atau sandi yang kosong tidak dihitung sebagai percobaan.

**Logika:** perulangan `repeat ... until` dengan penghitung `percobaan`. `continue` dipakai saat input kosong, dan `break` dipakai saat login berhasil.

### 2. Ringkasan Rekening
Menampilkan daftar pocket beserta saldo dan persennya, saldo di luar pocket, total saldo, total pemasukan, total pengeluaran, dan jumlah transaksi.

**Logika:** total saldo dihitung dengan menjumlahkan saldo di luar pocket dan saldo setiap pocket menggunakan perulangan `for`.

### 3. Input Pemasukan
Pengguna memasukkan nominal pemasukan, lalu memilih cara penyimpanannya:
1. **Pakai template persen:** uang dibagi otomatis ke setiap pocket sesuai persen yang sudah diatur.
2. **Atur nominal sendiri:** pengguna menentukan sendiri berapa rupiah untuk setiap pocket.
3. **Tidak dimasukkan ke pocket:** uang masuk ke saldo di luar pocket.

Kalau pengguna belum punya pocket, program meminta pengguna membuat pocket terlebih dahulu (1 sampai 8 pocket) dan memberi nama setiap pocket. Kalau memilih template tetapi template belum diatur, program meminta pengguna mengatur persen setiap pocket.

**Logika:** bagian tiap pocket = `nominal div 100 * persen`. Sisa uang yang tidak terbagi, misalnya karena total persen kurang dari 100% atau hasil pembulatan, otomatis masuk ke saldo di luar pocket.

### 4. Input Pengeluaran
Pengguna memilih sumber uang (pocket tertentu atau saldo di luar pocket), lalu memasukkan nominal pengeluaran.

**Logika:** pengeluaran hanya dicatat kalau saldo sumbernya cukup. Kalau tidak cukup, nominal tidak valid, atau nomor pocket tidak ada, procedure langsung berhenti menggunakan `exit`.

### 5. Kelola Pocket
- **Tambah pocket:** maksimal 8 pocket.
- **Ganti nama pocket.**
- **Atur template persen:** total persen semua pocket tidak boleh lebih dari 100%.
- **Hapus pocket:** saldo pocket yang dihapus dipindahkan ke saldo di luar pocket, dan pocket di belakangnya digeser maju satu nomor.

**Logika:** karena tidak memakai array, setiap pocket disimpan dalam variabel sendiri (`nama1`–`nama8`, `saldo1`–`saldo8`, `persen1`–`persen8`). Procedure `ambilPocket` dan `simpanPocket` memakai `case` untuk mengambil atau menyimpan data pocket berdasarkan nomornya. Setiap kali jumlah pocket berubah, template persen direset supaya pembagiannya tidak salah.

### 6. Analisis Keuangan
Menampilkan persentase pengeluaran dan sisa uang dari total pemasukan, beserta statusnya:
- **SEHAT:** sisa uang 20% atau lebih.
- **CUKUP:** sisa uang 10–19%.
- **WASPADA:** sisa uang di bawah 10%.

Tersedia juga menu **saran keuangan** berdasarkan literatur keuangan dan teori ekonomi:

| No | Topik | Isi |
|----|-------|-----|
| 1 | Cara membagi uang | Aturan 50/30/20 dan 40/30/20/10, beserta hitungan ideal dari pemasukan pengguna |
| 2 | Mengatur pemasukan | Prinsip menyisihkan uang di awal (*The Richest Man in Babylon*) dan Hukum Parkinson |
| 3 | Mengendalikan pengeluaran | Kebutuhan dan keinginan, belanja impulsif, Hukum Engel |
| 4 | Dana darurat | Besar dana darurat ideal dan pengecekan apakah saldo pengguna sudah cukup |
| 5 | Utang dan cicilan | Batas cicilan 30%, utang produktif dan konsumtif, bahaya pinjol ilegal |
| 6 | Menabung dan investasi | Inflasi, nilai waktu uang, prinsip 2L (Legal dan Logis) dari OJK |

**Logika:** rasio dihitung dengan tipe `real`, lalu status ditentukan dengan `if-else`. Setiap topik saran dibuat sebagai procedure terpisah.

### 7. Ganti Sandi
Pengguna harus memasukkan sandi lama, lalu sandi baru dua kali sebagai konfirmasi. Sandi baru tidak boleh kosong.

### 8. Reset Data
Menghapus semua data keuangan (pocket, saldo, pemasukan, pengeluaran, dan transaksi) supaya pengguna bisa mulai dari awal. Username dan sandi tidak ikut terhapus.

**Logika:** untuk mencegah reset tanpa sengaja, pengguna harus memasukkan sandi dan mengetik `RESET`. Kalau salah satunya tidak sesuai, reset dibatalkan dengan `exit`.

### 9. Penyimpanan Data Otomatis
Semua data disimpan ke file `marie.txt`, jadi data tidak hilang walaupun program ditutup.

**Logika:**
- procedure `simpanData` menulis data ke file setiap kali satu menu selesai (`assign`, `rewrite`, `writeln`, `close`);
- procedure `bacaData` membaca file saat program dibuka (`assign`, `reset`, `readln`, `close`);
- `FileExists` dipakai untuk mengecek apakah file sudah ada, supaya program tidak error saat pertama kali dijalankan.

---

## Panduan Penggunaan

### Kebutuhan
- [Free Pascal Compiler](https://www.freepascal.org/), atau IDE seperti Lazarus / Free Pascal IDE
- Sistem operasi Windows, Linux, atau macOS

### Cara Menjalankan
1. Clone atau download repositori ini.
2. Buka terminal di folder project, lalu compile programnya:
   ```
   fpc ProjekMARIE.pas
   ```
3. Jalankan program:
   - Windows: `ProjekMARIE.exe`
   - Linux/macOS: `./ProjekMARIE`

Program juga bisa dijalankan langsung dari VS Code atau Free Pascal IDE.

### Akun Awal
| Username | Sandi |
|----------|-------|
| `admin` | `1234` |

Sandi bisa diganti lewat menu **6. Ganti Sandi**.

### Contoh Alur Pemakaian
1. **Login** dengan username `admin` dan sandi `1234`.
2. Pilih **2. Input Pemasukan**, lalu masukkan nominal, misalnya `1000000`.
3. Pilih **1** (pakai template persen).
4. Karena belum punya pocket, buat pocket terlebih dahulu. Contoh: 3 pocket bernama `Makan`, `Transport`, dan `Tabungan`.
5. Atur persen setiap pocket. Contoh: Makan `50`, Transport `30`, Tabungan `20`.
6. Uang otomatis terbagi: Makan Rp 500.000, Transport Rp 300.000, Tabungan Rp 200.000.
7. Saat ada pengeluaran, pilih **3. Input Pengeluaran**, pilih pocket sumbernya, lalu masukkan nominalnya.
8. Lihat kondisi keuangan di **1. Ringkasan Rekening** dan **5. Analisis Keuangan**.
9. Pilih **0. Keluar** untuk menutup program. Data tetap tersimpan untuk pemakaian berikutnya.

### Menu Utama
| Menu | Fungsi |
|------|--------|
| 1 | Ringkasan Rekening |
| 2 | Input Pemasukan |
| 3 | Input Pengeluaran |
| 4 | Kelola Pocket |
| 5 | Analisis Keuangan dan Saran |
| 6 | Ganti Sandi |
| 7 | Reset Data |
| 0 | Keluar |

---

## Struktur File

| File | Keterangan |
|------|------------|
| `ProjekMARIE.pas` | Source code program |
| `marie.txt` | File penyimpanan data, dibuat otomatis saat program dijalankan |
| `README.md` | Dokumentasi repositori |

---

## Catatan
- Jumlah pocket maksimal 8.
- Nominal uang memakai tipe `longint`, sehingga batas maksimalnya sekitar Rp 2,1 miliar.
- Jangan mengedit `marie.txt` secara manual, karena urutan barisnya harus sesuai dengan yang dibaca program.
- Hapus `marie.txt` kalau ingin mengembalikan program ke kondisi awal, termasuk sandi kembali menjadi `1234`.
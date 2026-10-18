program marie_projeklab;
uses crt, sysutils;

const
  MAXPOCKET = 8;

var
  username, sandi: string;
  nama1, nama2, nama3, nama4, nama5, nama6, nama7, nama8: string;
  saldo1, saldo2, saldo3, saldo4, saldo5, saldo6, saldo7, saldo8: longint;
  persen1, persen2, persen3, persen4, persen5, persen6, persen7, persen8: integer;
  p, persenSkrg: integer;
  namaSkrg: string;
  saldoSkrg: longint;
  jumlahPocket, jumlahTransaksi: integer;
  saldoBebas, totalMasuk, totalKeluar, nominal: longint;
  menu, percobaan, i: integer;
  berhasil, templateAda: boolean;

procedure ambilPocket;
begin
  case p of
    1: begin namaSkrg := nama1; saldoSkrg := saldo1; persenSkrg := persen1; end;
    2: begin namaSkrg := nama2; saldoSkrg := saldo2; persenSkrg := persen2; end;
    3: begin namaSkrg := nama3; saldoSkrg := saldo3; persenSkrg := persen3; end;
    4: begin namaSkrg := nama4; saldoSkrg := saldo4; persenSkrg := persen4; end;
    5: begin namaSkrg := nama5; saldoSkrg := saldo5; persenSkrg := persen5; end;
    6: begin namaSkrg := nama6; saldoSkrg := saldo6; persenSkrg := persen6; end;
    7: begin namaSkrg := nama7; saldoSkrg := saldo7; persenSkrg := persen7; end;
    8: begin namaSkrg := nama8; saldoSkrg := saldo8; persenSkrg := persen8; end;
  end;
end;

procedure simpanPocket;
begin
  case p of
    1: begin nama1 := namaSkrg; saldo1 := saldoSkrg; persen1 := persenSkrg; end;
    2: begin nama2 := namaSkrg; saldo2 := saldoSkrg; persen2 := persenSkrg; end;
    3: begin nama3 := namaSkrg; saldo3 := saldoSkrg; persen3 := persenSkrg; end;
    4: begin nama4 := namaSkrg; saldo4 := saldoSkrg; persen4 := persenSkrg; end;
    5: begin nama5 := namaSkrg; saldo5 := saldoSkrg; persen5 := persenSkrg; end;
    6: begin nama6 := namaSkrg; saldo6 := saldoSkrg; persen6 := persenSkrg; end;
    7: begin nama7 := namaSkrg; saldo7 := saldoSkrg; persen7 := persenSkrg; end;
    8: begin nama8 := namaSkrg; saldo8 := saldoSkrg; persen8 := persenSkrg; end;
  end;
end;

{simpan & baca file}
procedure simpanData;
var
  f: text;
  k: integer;
Begin
  assign(f, 'marie.txt');
  rewrite(f);
  writeln(f, username);
  writeln(f, sandi);
  writeln(f, jumlahPocket);
  if templateAda = true then
    writeln(f, 1)
  else
    writeln(f, 0);
  writeln(f, saldoBebas);
  writeln(f, totalMasuk);
  writeln(f, totalKeluar);
  writeln(f, jumlahTransaksi);
  for k := 1 to jumlahPocket do
  begin
    p := k;
    ambilPocket;
    writeln(f, namaSkrg);
    writeln(f, saldoSkrg);
    writeln(f, persenSkrg);
  end;
  close(f);
End;

procedure bacaData;
var
    f: text;
    k, t: integer;
begin
    assign(f, 'marie.txt');
    reset(f);
    readln(f, username);
    readln(f, sandi);
    readln(f, jumlahPocket);
    readln(f, t);
    if t = 1 then
        templateAda := true
    else
        templateAda := false;
    readln(f, saldoBebas);
    readln(f, totalMasuk);
    readln(f, totalKeluar);
    readln(f, jumlahTransaksi);
    for k := 1 to jumlahPocket do
    begin
        p := k;
        readln(f, namaSkrg);
        readln(f, saldoSkrg);
        readln(f, persenSkrg);
        simpanPocket;
    end;
    close(f);
end;

procedure login;
var
    u, s: string;
begin
    berhasil := false;
    percobaan := 0;
    repeat
        clrscr;
        writeln('==========================================================');
        writeln('                __  __    _    ____  ___ _____ ');
        writeln('               |  \/  |  / \  |  _ \|_ _| ____|');
        writeln('               | |\/| | / _ \ | |_) || ||  _|  ');
        writeln('               | |  | |/ ___ \|  _ < | || |___ ');
        writeln('               |_|  |_/_/   \_\_| \_\___|_____|');
        writeln;
        writeln(' Money Allocation, Regulation, Intelligence & Evaluation');
        writeln('==========================================================');
        writeln('                         LOGIN');
        write('  Username : ');
        readln(u);
        write('  Sandi    : ');
        readln(s);
        if (u = '') or (s = '') then
        begin
            writeln('  Username dan sandi harus diisi');
            write('  Tekan enter untuk coba lagi...');
            readln;
            continue;
        end;
        if (u = username) and (s = sandi) then
        begin
            berhasil := true;
            break;
        end;
        percobaan := percobaan + 1;
        writeln('  Username atau sandi salah, sisa ', 3 - percobaan, ' kali lagi');
        write('  Tekan enter...');
        readln;
    until percobaan = 3;
end;

procedure lihatPocket;
var
  k: integer;
begin
  writeln('Pocket kamu :');
  if jumlahPocket = 0 then
    writeln('Belum ada pocket');
  for k := 1 to jumlahPocket do
  begin
    p := k;
    ambilPocket;
    if templateAda = true then
      writeln(k, '. ', namaSkrg, ' - Rp ', saldoSkrg, ' (', persenSkrg, '%)')
    else
      writeln(k, '. ', namaSkrg, ' - Rp ', saldoSkrg);
  end;
end;

procedure ringkasan;
var
  k : integer;
  total: longint;
begin
  writeln('========= RINGKASAN =========');
  total := saldoBebas;
  for k := 1 to jumlahPocket do
  begin
    p := k;
    ambilPocket;
    total := total + saldoSkrg;
  end;
  lihatPocket;
  writeln;
  writeln('Saldo diluar pocket : Rp ', saldoBebas);
  writeln('Total saldo         : Rp ', total);
  writeln('Total pemasukan     : Rp ', totalMasuk);
  writeln('Total pengeluaran   : Rp ', totalKeluar);
  writeln('Jumlah transaksi    : ', jumlahTransaksi);
end;

procedure aturPersen;
var
  k, total: integer;
begin
  clrscr;
  writeln('==== ATUR TEMPLATE PERSEN ====');
  repeat
    total := 0;
    writeln('Masukkan persen untuk tiap pocket (total maksimal 100)');
    for k := 1 to jumlahPocket do
    begin
      p := k;
      ambilPocket;
      write(namaSkrg, ' : ');
      readln(persenSkrg);
      if persenSkrg < 0 then
        persenSkrg := 0;
      simpanPocket;
      total := total + persenSkrg;
    end;
    if total > 100 then
      writeln('Total ', total, '% lebih dari 100%, ulangi lagi');
  until total <= 100;
  templateAda := true;
  writeln('Template disimpan, sisa ', 100 - total, '% masuk ke saldo diluar pocket');
end;

procedure resetTemplate;
var
  k: integer;
begin
  for k := 1 to MAXPOCKET do
  begin
    p := k;
    ambilPocket;
    persenSkrg := 0;
    simpanPocket;
  end;
  templateAda := false;
end;

procedure buatPocket;
var
  n, k: integer;
begin
  clrscr;
  writeln('--- BUAT POCKET ---');
  writeln('Kamu belum punya pocket, buat dulu');
  repeat
    write('Mau buat berapa pocket? (1-8) : ');
    readln(n);
    if (n < 1) or (n > MAXPOCKET) then
      writeln('Jumlah pocket harus 1 sampai ', MAXPOCKET);
  until (n >= 1) and (n <= MAXPOCKET);

  jumlahPocket := n;
  for k := 1 to jumlahPocket do
  begin
    p := k;
    repeat
      write('Nama pocket ke-', k, ' : ');
      readln(namaSkrg);
      if namaSkrg = '' then
        writeln('Nama tidak boleh kosong');
    until namaSkrg <> '';
    saldoSkrg := 0;
    persenSkrg := 0;
    simpanPocket;
  end;
  templateAda := false;
  writeln(jumlahPocket, ' pocket berhasil dibuat');
  writeln;
end;

procedure pemasukan;
var
    k, pil: integer;
    sisa, bagian: longint;
begin
    writeln('===== PEMASUKAN =====');
    write('Jumlah pemasukan : Rp ');
    readln(nominal);
    if nominal <= 0 then
    begin
        writeln('nominalnya harus lebih dari 0 ya');
        exit;
    end;

    totalMasuk := totalMasuk + nominal;
    jumlahTransaksi := jumlahTransaksi + 1;

    if templateAda = true then
    begin
        writeln('Template pembagian kamu :');
        for k := 1 to jumlahPocket do
        begin
            p := k;
            ambilPocket;
            writeln(namaSkrg, ' ', persenSkrg, '% = Rp ', nominal div 100 * persenSkrg);
        end;
        writeln;
    end;
    writeln('1. Masukkan ke pocket pakai template persen');
    writeln('2. Masukkan ke pocket, atur nominal sendiri');
    writeln('3. Tidak dimasukkan ke pocket');
    write('Pilih : ');
    readln(pil);

    if ((pil = 1) or (pil = 2)) and (jumlahPocket = 0) then
        buatPocket;

    sisa := nominal;
    case pil of
        1: begin
                  if templateAda = false then
                      aturPersen;
                  for k := 1 to jumlahPocket do
                  begin
                      p := k;
                      ambilPocket;
                      bagian := nominal div 100 * persenSkrg;
                      saldoSkrg := saldoSkrg + bagian;
                      simpanPocket;
                      sisa := sisa - bagian;
                  end;
              end;
        2: begin
                  for k := 1 to jumlahPocket do
                  begin
                      if sisa = 0 then
                          break;
                      p := k;
                      ambilPocket;
                      write(namaSkrg, ' (sisa Rp ', sisa, ') : Rp ');
                      readln(bagian);
                      if (bagian < 0) or (bagian > sisa) then
                      begin
                          writeln('Nominal tidak valid, pocket ini dilewati');
                          continue;
                      end;
                      saldoSkrg := saldoSkrg + bagian;
                      simpanPocket;
                      sisa := sisa - bagian;
                  end;
              end;
        3: writeln('Uang masuk ke saldo diluar pocket');
    else
        writeln('Pilihan salah, uang masuk ke saldo diluar pocket');
    end;

    saldoBebas := saldoBebas + sisa;
    writeln;
    writeln('Pemasukan sudah masuk');
    write('Tekan enter untuk melihat ringkasan...');
    readln;
    clrscr;
    ringkasan;
end;

procedure pengeluaran;
var
  sumber: integer;
begin
  Writeln('-- PENGELUARAN --');
  lihatPocket;
  Writeln('0. Saldo diluar pocket - Rp ', saldoBebas);
  Write('Ambil dari nomor : ');
  Readln(sumber);
  if (sumber < 0) or (sumber > jumlahPocket) then
  begin
    Writeln('nomor pocketnya ga ada');
    exit;
  end;

  Write('Jumlah pengeluaran : Rp ');
  Readln(nominal);
  if nominal <= 0 then
  begin
    Writeln('nominalnya harus lebih dari 0 ya');
    exit;
  end;

  if sumber = 0 then
  begin
    if nominal > saldoBebas then
    begin
      Writeln('saldo ga cukup');
      exit;
    end;
    saldoBebas := saldoBebas - nominal;
  end
  else
  begin
    p := sumber;
    ambilPocket;
    if nominal > saldoSkrg then
    begin
      Writeln('Saldo ', namaSkrg, ' ga cukup');
      exit;
    end;
    saldoSkrg := saldoSkrg - nominal;
    simpanPocket;
  end;

  totalKeluar := totalKeluar + nominal;
  jumlahTransaksi := jumlahTransaksi + 1;
  Writeln('pengeluaran sudah dicatat');
end;

procedure kelolaPocket;
var
  pil, no, k : integer;
begin
  repeat
    clrscr;
    writeln('+==========================================================+');
    writeln('|                K E L O L A   P O C K E T                 |');
    writeln('+==========================================================+');
    lihatPocket;
    writeln('+----------------------------------------------------------+');
    writeln('|  1. Tambah pocket                                        |');
    writeln('|  2. Ganti nama pocket                                    |');
    writeln('|  3. Atur template persen                                 |');
    writeln('|  4. Hapus pocket                                         |');
    writeln('|  0. Kembali                                              |');
    writeln('+----------------------------------------------------------+');
    write('  Pilih : ');
    readln(pil);
    clrscr;

    case pil of
      1: begin
           if jumlahPocket = MAXPOCKET then
             writeln('Pocket sudah penuh, maksimal ', MAXPOCKET, ' pocket')
           else
           begin
             jumlahPocket := jumlahPocket + 1;
             if templateAda = true then
             begin
               resetTemplate;
               writeln('Jumlah pocket berubah, template direset');
             end;
             p := jumlahPocket;
             write('Nama pocket : ');
             readln(namaSkrg);
             if namaSkrg = '' then
               namaSkrg := 'Pocket Baru';
             saldoSkrg := 0;
             persenSkrg := 0;
             simpanPocket;
             writeln('pocket baru sudah ditambah');
           end;
         end;
      2: begin
           writeln('Ganti nama pocket');
           lihatPocket;
           writeln;
           write('Nomor pocket : ');
           readln(no);
           if (no < 1) or (no > jumlahPocket) then
             writeln('nomor pocketnya ga ada')
           else
           begin
             p := no;
             ambilPocket;
             write('Nama baru : ');
             readln(namaSkrg);
             simpanPocket;
             writeln('nama sudah diganti');
           end;
         end;
      3: begin
           if jumlahPocket = 0 then
             writeln('Belum ada pocket')
           else
             aturPersen;
         end;
      4: begin
           writeln('Hapus pocket');
           lihatPocket;
           writeln;
           write('Nomor pocket yang mau dihapus : ');
           readln(no);
           if (no < 1) or (no > jumlahPocket) then
             writeln('nomor pocketnya ga ada')
           else
           begin
             p := no;
             ambilPocket;
             saldoBebas := saldoBebas + saldoSkrg;
             for k := no to jumlahPocket - 1 do
             begin
               p := k + 1;
               ambilPocket;
               p := k;
               simpanPocket;
             end;
             jumlahPocket := jumlahPocket - 1;
             if templateAda = true then
             begin
               resetTemplate;
               writeln('Jumlah pocket berubah, template direset');
             end;
             writeln('Pocket dihapus, saldonya dipindah ke saldo diluar pocket');
           end;
         end;
      0: writeln('kembali...');
    else
      writeln('pilihan ga ada');
    end;

    writeln('tekan enter...');
    readln;
  until pil = 0;
end;

procedure gantiSandi;
var
  lama, baru, ulang: string;
begin
  Writeln('--- Ganti Sandi ---');
  Write('Sandi lama : ');
  Readln(lama);
  if lama <> sandi then
  begin
    Writeln('sandi lama salah!');
    exit;
  end;

  Write('Sandi baru : ');
  Readln(baru);
  Write('Ulangi sandi baru : ');
  Readln(ulang);
  if baru = '' then
    Writeln('Sandi tidak boleh kosong')
  else if baru <> ulang then
    Writeln('sandinya ga sama, coba lagi')
  else
  begin
    sandi := baru;
    Writeln('Sandi sudah diganti');
  end;
end;

procedure resetData;
var
  s, yakin: string;
begin
  Writeln('=== RESET DATA ===');
  Writeln('Semua pocket, saldo, pemasukan, dan pengeluaran');
  Writeln('akan dihapus. Username dan sandi tetap sama.');
  writeln;
  Write('Masukkan sandi kamu : ');
  Readln(s);
  if s <> sandi then
  begin
    Writeln('Sandi salah, reset dibatalkan');
    exit;
  end;

  Write('Ketik RESET untuk melanjutkan : ');
  Readln(yakin);
  if yakin <> 'RESET' then
  begin
    Writeln('Reset dibatalkan');
    exit;
  end;

  for i := 1 to MAXPOCKET do
  begin
    p := i;
    namaSkrg := '';
    saldoSkrg := 0;
    persenSkrg := 0;
    simpanPocket;
  end;
  jumlahPocket := 0;
  templateAda := false;
  saldoBebas := 0;
  totalMasuk := 0;
  totalKeluar := 0;
  jumlahTransaksi := 0;
  writeln;
  Writeln('Data berhasil direset, mulai dari awal lagi');
end;


{saran-saran}
procedure saranPembagian;
begin
  writeln('==== CARA MEMBAGI UANG ====');
  writeln;
  writeln('1. Aturan 50/30/20 (Elizabeth Warren)');
  writeln('   50% kebutuhan  : makan, kos, transport, listrik');
  writeln('   30% keinginan  : jajan, nongkrong, hiburan');
  writeln('   20% tabungan   : tabungan, dana darurat, investasi');
  writeln;
  writeln('2. Aturan 40/30/20/10 (sering dipakai di Indonesia)');
  writeln('   40% biaya hidup sehari-hari');
  writeln('   30% cicilan atau utang (paling banyak)');
  writeln('   20% tabungan dan investasi');
  writeln('   10% sosial, zakat, sedekah, keluarga');
  if totalMasuk > 0 then
  begin
    writeln;
    writeln('Dari total pemasukan kamu Rp ', totalMasuk, ', idealnya :');
    writeln('   Kebutuhan maksimal Rp ', totalMasuk div 100 * 50);
    writeln('   Keinginan maksimal Rp ', totalMasuk div 100 * 30);
    writeln('   Tabungan minimal   Rp ', totalMasuk div 100 * 20);
  end;
end;

procedure saranPemasukan;
begin
  writeln('==== MENGATUR PEMASUKAN ====');
  writeln;
  writeln('1. Sisihkan di awal, bukan sisa di akhir');
  writeln('   Buku The Richest Man in Babylon (George Clason)');
  writeln('   menyarankan simpan minimal 10% begitu uang masuk.');
  writeln('   Gunakan pocket supaya langsung terpisah.');
  writeln;
  writeln('2. Catat semua uang yang masuk');
  writeln('   Uang saku, gaji, hasil usaha, atau bonus tetap');
  writeln('   dicatat supaya tahu kemampuan keuangan sebenarnya.');
  writeln;
  writeln('3. Jangan naikkan gaya hidup saat pemasukan naik');
  writeln('   Hukum Parkinson : pengeluaran cenderung naik');
  writeln('   mengikuti pemasukan. Kalau pemasukan naik,');
  writeln('   naikkan dulu persen tabungannya.');
end;

procedure saranPengeluaran;
begin
  writeln('==== MENGENDALIKAN PENGELUARAN ====');
  writeln;
  writeln('1. Bedakan kebutuhan dan keinginan');
  writeln('   Kebutuhan : kalau tidak dipenuhi hidup terganggu.');
  writeln('   Keinginan : bisa ditunda tanpa masalah.');
  writeln;
  writeln('2. Tunda pembelian barang yang tidak direncanakan');
  writeln('   Tunggu 1-3 hari. Kalau masih perlu, baru beli.');
  writeln('   Ini membantu menghindari belanja impulsif.');
  writeln;
  writeln('3. Hati-hati pengeluaran kecil yang rutin');
  writeln('   Kopi, jajan, ongkir, langganan aplikasi.');
  writeln('   Kecil tiap hari, tapi besar kalau dijumlah sebulan.');
  writeln;
  writeln('4. Hukum Engel (Ernst Engel)');
  writeln('   Makin besar porsi uang untuk makan, biasanya makin');
  writeln('   sedikit ruang untuk menabung. Atur porsi makan.');
end;

procedure saranDanaDarurat;
var
  bulanan, total: longint;
  k: integer;
begin
  writeln('==== DANA DARURAT ====');
  writeln;
  writeln('Dana darurat dipakai saat sakit, kehilangan kerja,');
  writeln('atau kejadian mendadak. Saran perencana keuangan :');
  writeln('   Belum menikah    : 3-6 kali pengeluaran bulanan');
  writeln('   Sudah menikah    : 6-9 kali pengeluaran bulanan');
  writeln('   Sudah punya anak : 9-12 kali pengeluaran bulanan');
  writeln('Simpan di tempat yang mudah diambil, misal tabungan.');
  writeln;
  write('Berapa pengeluaran kamu per bulan? Rp ');
  readln(bulanan);
  if bulanan > 0 then
  begin
    total := saldoBebas;
    for k := 1 to jumlahPocket do
    begin
      p := k;
      ambilPocket;
      total := total + saldoSkrg;
    end;
    writeln;
    writeln('Dana darurat minimal : Rp ', bulanan * 3);
    writeln('Saldo kamu sekarang  : Rp ', total);
    if total >= bulanan * 3 then
      writeln('Dana darurat kamu sudah cukup, pertahankan')
    else
      writeln('Masih kurang Rp ', bulanan * 3 - total, ', sisihkan sedikit-sedikit');
  end;
end;

procedure saranUtang;
begin
  Writeln('==== UTANG DAN CICILAN ====');
  writeln;
  Writeln('1. Total cicilan maksimal 30% dari pemasukan');
  Writeln('   Bank biasanya memakai batas ini sebelum memberi');
  Writeln('   pinjaman. Lebih dari itu keuangan mudah goyah.');
  writeln;
  Writeln('2. Bedakan utang produktif dan konsumtif');
  Writeln('   Produktif : modal usaha, alat kerja.');
  Writeln('   Konsumtif : gadget, liburan, barang gaya hidup.');
  Writeln('   Hindari utang konsumtif, apalagi paylater.');
  writeln;
  Writeln('3. Hindari pinjol ilegal');
  Writeln('   Cek dulu apakah terdaftar di OJK.');
  Writeln('   Bunga dan dendanya bisa jauh lebih besar.');
  writeln;
  Writeln('4. Lunasi utang dengan bunga paling besar dulu');
end;

procedure saranInvestasi;
begin
  writeln('==== MENABUNG DAN INVESTASI ====');
  writeln;
  writeln('1. Inflasi membuat nilai uang turun');
  writeln('   Harga barang naik tiap tahun, jadi uang yang');
  writeln('   cuma didiamkan daya belinya makin kecil.');
  writeln;
  writeln('2. Nilai waktu uang (time value of money)');
  writeln('   Uang hari ini lebih berharga dari uang nanti,');
  writeln('   karena bisa dikembangkan. Mulai sedini mungkin.');
  writeln;
  writeln('3. Siapkan dana darurat dulu, baru investasi');
  writeln;
  writeln('4. Ingat prinsip 2L dari OJK : Legal dan Logis');
  writeln('   Legal : lembaganya terdaftar dan diawasi OJK.');
  writeln('   Logis : untung tidak masuk akal = waspada penipuan.');
  writeln;
  writeln('5. Untuk pemula : tabungan berjangka, deposito,');
  writeln('   reksa dana pasar uang, atau emas.');
end;

procedure analisis;
var
    pil: integer;
    keluar, simpan: real;
begin
    repeat
        clrscr;
        writeln('+==========================================================+');
        writeln('|          A N A L I S I S   K E U A N G A N               |');
        writeln('+==========================================================+');
        if totalMasuk = 0 then
            writeln('  Belum ada pemasukan, catat dulu pemasukan kamu')
        else
        begin
            keluar := totalKeluar / totalMasuk * 100;
            simpan := 100 - keluar;
            writeln('  Pengeluaran : ', keluar:0:1, '% dari pemasukan');
            writeln('  Sisa        : ', simpan:0:1, '% dari pemasukan');
            if simpan >= 20 then
                writeln('  Status : SEHAT, sisa uang sudah 20% atau lebih')
            else if simpan >= 10 then
                writeln('  Status : CUKUP, usahakan sisa minimal 20%')
            else
                writeln('  Status : WASPADA, pengeluaran terlalu besar');
        end;
        writeln('+----------------------------------------------------------+');
        writeln('|  Saran keuangan :                                        |');
        writeln('|  1. Cara membagi uang                                    |');
        writeln('|  2. Mengatur pemasukan                                   |');
        writeln('|  3. Mengendalikan pengeluaran                            |');
        writeln('|  4. Dana darurat                                         |');
        writeln('|  5. Utang dan cicilan                                    |');
        writeln('|  6. Menabung dan investasi                               |');
        writeln('|  0. Kembali                                              |');
        writeln('+----------------------------------------------------------+');
        write('  Pilih : ');
        readln(pil);
        clrscr;
        case pil of
            1: saranPembagian;
            2: saranPemasukan;
            3: saranPengeluaran;
            4: saranDanaDarurat;
            5: saranUtang;
            6: saranInvestasi;
            0: writeln('kembali...');
        else
            writeln('pilihan ga ada');
        end;
        if pil <> 0 then
        begin
            writeln;
            write('tekan enter...');
            readln;
        end;
    until pil = 0;
end;

begin
    clrscr;
    username := 'admin';
    sandi := '1234';

    for i := 1 to MAXPOCKET do
    begin
        p := i;
        namaSkrg := '';
        saldoSkrg := 0;
        persenSkrg := 0;
        simpanPocket;
    end;
    jumlahPocket := 0;
    templateAda := false;
    saldoBebas := 0;
    totalMasuk := 0;
    totalKeluar := 0;
    jumlahTransaksi := 0;

    if FileExists('marie.txt') then
        bacaData;

  

  login;
    if berhasil = false then
        writeln('AKUN TERKUNCI, coba lagi nanti')
    else
    begin
        repeat
            clrscr;
            writeln('+==========================================================+');
            writeln('|                        M A R I E                         |');
            writeln('| Money Allocation, Regulation, Intelligence & Evaluation  |');
            writeln('+==========================================================+');
            writeln('|  1. Ringkasan Rekening                                   |');
            writeln('|  2. Input Pemasukan                                      |');
            writeln('|  3. Input Pengeluaran                                    |');
            writeln('|  4. Kelola Pocket                                        |');
            writeln('|  5. Analisis Keuangan                                    |');
            writeln('|  6. Ganti Sandi                                          |');
            writeln('|  7. Reset Data                                           |');
            writeln('|  0. Keluar                                               |');
            writeln('+==========================================================+');
            write('  Pilih menu : ');
            readln(menu);
            clrscr;
            case menu of
                1: ringkasan;
                2: pemasukan;
                3: pengeluaran;
                4: kelolaPocket;
                5: analisis;
                6: gantiSandi;
                7: resetData;
                0: writeln('Terimakasih sudah pakai MARIE :)');
            else
                writeln('menu tidak tersedia!!');
            end;
            simpanData;
            if menu <> 0 then
            begin
                writeln;
                writeln('Tekan enter untuk kembali ke menu...');
                readln;
            end;
        until menu = 0;
    end;
end.
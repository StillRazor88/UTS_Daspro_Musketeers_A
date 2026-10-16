program marie_projeklab;
uses crt;
var 
    username, sandi : string; // login akun
    saldo : array[1..3] of longint;   // 1=makan, 2=kos, 3=tabungan
    nama  : array[1..3] of string;    // nama tiap pocket
    i     : integer;                  // penghitung loop
    totalPengeluaran, jumlahTransaksi : longint;
    nominal : longint;                       // angka uang yang diketik pengguna (pemasukan/pengeluaran)
    menu, pilihPocket, percobaan : integer;  // pilihan menu, pilihan pocket & percobaan akun
    berhasil : boolean;           // mendeteksi akun berhasil login atau tidak

procedure Login;
    begin
    berhasil := false;
    percobaan := 0;
    repeat
    write('Username : ');
    readln(username);
    write('Sandi    : ');
    readln(sandi);
    if (username = '') or (sandi = '') then
    begin
        writeln('Tidak boleh kosong');
        continue;
    end;
    if (username = 'admin') and (sandi = '1234') then
    begin
        berhasil := true;
        break;
    end;
    percobaan := percobaan + 1;
    writeln('Salah! Sisa kesempatan : ', 3 - percobaan);
    until percobaan = 3;
    end;

begin
    clrscr;
    // isi nama pocket
    nama[1] := 'Makan';
    nama[2] := 'Uang Kos';
    nama[3] := 'Tabungan';

    // set semua saldo jadi 0
    for i := 1 to 3 do
        saldo[i] := 0;
    totalPengeluaran := 0;
    jumlahTransaksi := 0;

    // siapkan login
    percobaan := 0;
    Login;              
    if berhasil then
    begin
    repeat
        writeln('1. Input Pemasukan');
        writeln('0. Keluar');
        readln(menu);
        case menu of
            1 : begin
            write('Masukkan Pemasukan Anda : ');
            readln(nominal);
                if nominal <= 0 then
                writeln('Nominal harus lebih dari 0')
                else
                begin
                    if nominal < 1000000 then
                    begin
                    saldo[1] := saldo[1] + nominal * 45 div 100;
                    saldo[2] := saldo[2] + nominal * 40 div 100;
                    saldo[3] := saldo[3] + nominal * 15 div 100;
                    end
                    else if nominal < 3000000 then
                    begin
                    saldo[1] := saldo[1] + nominal * 35 div 100;
                    saldo[2] := saldo[2] + nominal * 40 div 100;
                    saldo[3] := saldo[3] + nominal * 25 div 100;
                    end
                    else
                    begin
                    saldo[1] := saldo[1] + nominal * 30 div 100;
                    saldo[2] := saldo[2] + nominal * 35 div 100;
                    saldo[3] := saldo[3] + nominal * 35 div 100;
                    end;

                    
                    writeln('Saldo Makan    : ', saldo[1]);
                    writeln('Saldo Uang Kos : ', saldo[2]);
                    writeln('Saldo Tabungan : ', saldo[3]);
                end;
            writeln('Tekan Enter untuk kembali ke menu...');
            readln;
            end;
            0 : writeln('Terima kasih sudah memakai Smart Budget');
        end;
    until menu = 0;
    end
    else
    writeln('Akun Terkunci');
end.

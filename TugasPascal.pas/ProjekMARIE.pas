program marie_projeklab;
uses wincrt, crt;
var
    makan, uangkos, tabungan : longint;      // saldo tiap pocket
    totalPengeluaran, jumlahTransaksi : longint;
    nominal : longint;                       // angka uang yang diketik pengguna (pemasukan/pengeluaran)
    menu, pilihPocket : integer;             // pilihan menu & pilihan pocket
begin
    repeat
        clrscr;
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
                    makan := makan + nominal * 45 div 100;
                    uangkos := uangkos + nominal * 40 div 100;
                    tabungan := tabungan + nominal * 15 div 100;
                end;
            write('Masukkan Uang Makan Anda : ');
            readln(makan);
            write('Masukkan Tabungan Anda : ');
            readln(tabungan);
            writeln('Tekan Enter untuk kembali ke menu...');
            readln;
            end;
            0 : writeln('Terima kasih sudah memakai Smart Budget');
        end;
    until menu = 0;

end.
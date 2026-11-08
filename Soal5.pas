Program deretBilangan; //Membuat deret bilangan sesuai yang tertera pada soal
uses crt;

function deretFibonacci(a :integer): Int64; //Deret Fibonacci, yaitu penjumlahan dua angka sebelumnya
var 
i : integer;
x, y, sementara : Int64;
begin

    if (a = 1) or (a = 2) then //Sebagai checkpoint awal untuk membentuk deret fibonacci agar bisa dijumlahkan
    deretFibonacci := 1 //input suku ke-1 atau suku ke-2, tetap menampilkan angka 1
    else
    begin
    x := 1; // Menyimpan suku Fibonacci sebelumnya.
    y := 1;  // Menyimpan suku Fibonacci saat ini.

    for i := 3 to a do // Menghitung suku ke-3 sampai suku ke-a.
    begin
        sementara := x + y; // Suku berikutnya adalah jumlah dua suku sebelumnya.
        x := y;             // Geser: suku saat ini menjadi suku sebelumnya.
        y := sementara;     // Simpan suku yang baru dihitung.
    end;
    deretFibonacci := y; // Mengembalikan suku Fibonacci ke-a.
    end;
end;

function deretGeometri(a :integer): Int64; //Deret Geometri, memiliki rasio 2
var 
x : Int64; 
i : integer;
begin
    x := 1; // Nilai awal 1, yaitu 2 pangkat 0.
    for i:= 1 to a do // Kalikan dengan rasio 2 sebanyak a kali.
    begin
        x := x * 2;
    end;
    deretGeometri := x; // Mengembalikan hasil 2 pangkat a.
end;

function deretKuadrat(a :integer):Int64; //Menghitung deret geometri
begin
        deretKuadrat := a * a //Melakukan perkalian dengan dirinya sendiri seolah-olah (a^2)
end;

function deretTingkatDua(a :integer):Int64;
// Menghitung suku ke-a pada deret 2, 6, 12, 20, 30, 42, ...
// Rumusnya a * (a + 1), yaitu nomor suku dikali bilangan setelahnya.
begin
    deretTingkatDua := a * (a + 1); // Contoh: suku ke-4 = 4 * 5 = 20.
end;

var
suku, i, kode : integer;
masukan : string;
valid : boolean;
begin
    writeln ('============== PROGRAM MENAMPILKAN DERET ==============');
    repeat
    write ('Masukkan Banyak Suku yang Ingin Ditampilkan: '); //Masukkan input berupa angka 
    readln (masukan);
    Val(masukan, suku, kode); 

    if kode <> 0 then //Kalau masukin tipe data selain "Angka" maka disuruh input ulang dengan benar
    begin
        writeln ('Masukkan bilangan bulat yang valid ! ');
        valid := false;
    end
    else if (suku < 1) or (suku > 63) then //Jika input bilangan 0 atau bil.negatif, maka diuruh input ulang sampai benar
    begin
        writeln ('Masukkan Bilangan Positif !. Input bilangan dari 1 hingga 63! ');
        valid := false;
    end
    else
        valid := true;
    until valid; //di-ulang terus sampai benar

// Menampilkan deret Fibonacci dari suku pertama sampai suku ke-suku.
write('Deret Fibonacci: ');
for i := 1 to suku do
    write(deretFibonacci(i), ' '); // Memanggil fungsi untuk menghitung suku ke-i.
writeln; // Pindah ke baris baru setelah deret selesai ditampilkan.

// Menampilkan deret geometri dari 2^0 sampai 2^(suku-1).
write('Deret Geometri: ');
for i := 1 to suku do
    write(deretGeometri(i - 1), ' '); // i-1 membuat pangkat pertama dimulai dari 0.
writeln;

// Menampilkan deret kuadrat dari suku pertama sampai suku ke-suku.
write('Deret Kuadrat: ');
for i := 1 to suku do
    write(deretKuadrat(i), ' '); // Memanggil fungsi untuk menghitung kuadrat dari i.
writeln;

// Menampilkan deret tingkat dua dari suku pertama sampai suku ke-suku.
write('Deret Tingkat Dua: ');
for i := 1 to suku do
    write(deretTingkatDua(i), ' '); // Memanggil fungsi untuk menghitung suku ke-i.
writeln;
end.
{

NOTES :
Karna di soal tidak ditentukan mau buat seberapa banyak sukunya, maka suku yang memungkinkan untuk
di input hanyalah sampai 63 suku, dikarenakan keterbatasan tipe data yang ada, dimulai dari integer,
longint, hingga saat ini didapatkan sampai suku ke-63 saja (Int64). Karena jika di input lebih dari itu, 
pada bagian deret geometri akan menampilkan bilangan negatif atau 0. Oleh karenanya saya batasi dahulu
di bagian (repeat-until), agar tidak terjadinya malfungsi pada program. Kalau ingin tetap di jebol,
(berarti menghapus kode yang membatasi input lebih dari 63 suku yaitu suku > 63m), maka akan menghasilkan deret geometri
pada suku setelahnya bernilai negatif atau 0 (dikarenakan overflow)


Sedikit tambahan, khusus pada deret geometri, soal yang diminta bermula dari 1 (2^0 = 1).
misalnya saat input, kita masukkan angka 30 suku, artinya perhitunggannya akan berakhir di suku 29 (30-1 = 29)

Contoh simple
Input banyak suku : 8
Deret Geometri : yang ditampilkan bagian akhirnya adalah 2^7, karna kita startnya dari 2^0
(Alias kita bilangnya kayak bilangan biner bang, dimulai dari 2^0 dulu. Sehingga maknanya itu
terdapat 8 buah suku , yang nilainya dimulai dari 2^0 sampai 2^7)


Info juga yaitu disini saya memakai Int64 (Tipe data yang jauh lebih banyak cakupan data angkanya dibanding longint), 
untuk memperluas lagi suku yang bisa dihitung alih-alih menggunakan longint.
Karena longint terlalu sedikit suku yang bisa di perluas/ditampilkan (dieksplor).

}
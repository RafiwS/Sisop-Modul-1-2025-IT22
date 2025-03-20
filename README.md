```
===================== KELOMPOK IT22 =======================
Ananda Widi Alrafi 5027241067
Raynard Carlent 5027241109
Zahra Hafizhah 5027241121
===========================================================
```
#Soal no 1
1. Dalam nomer 1 ini kita akan mencari 4 hal, yaitu total chris hemsworth membaca buku, berapa durasi tablet, rating tertinggi, dan mencari genre populer
2. Menggunakan shell dan juga condition if pada awk yang sudah ditentukan
```sh
awk -F, '
BEGIN { count=0 } 
{
    if ($2 == "Chris Hemsworth") 
        count++;
} 
END { 
    if (count > 0) 
        print "Chris Hemsworth membaca", count, "buku.";
    else 
        print "Chris Hemsworth tidak membaca buku.";
}
' reading_data.csv
```
Pada shell di atas ini, poin tersebut mencari berapa banyak buku yang dibaca oleh Chris Hemsworth dengan membaca reading_data.csv. Menggunakan condition IF
```sh
awk -F, '
BEGIN { sum=0; count=0 } 
{
    if ($8 == "Tablet") {
        sum += $6; 
        count++;
    }
} 
END { 
    if (count > 0) 
        printf "Rata-rata durasi membaca dengan Tablet adalah %.2f menit\n", sum/count;
    else 
        print "Tidak ada data membaca dengan Tablet.";
}
' reading_data.csv
```
Pada shell di atas ini, poin ini mencari berapa durasi lama melihat tablet yang terdapat pada file reading_data.csv. Menggunakan condition IF
```sh
awk -F, '
BEGIN { max=0 }
NR == 1 { next } 
{
    if ($7 > max) {
        max=$7; 
        name=$2; 
        book=$3;
    }
}
END { 
    if (max > 0) 
        print "Pembaca dengan rating tertinggi:", name, "-", book, "-", max;
    else 
        print "Tidak ada data rating.";
}
' reading_data.csv
```
Pada shell di atas ini, poin ini mencari pembaca dengan rating tertinggi, untuk rating ini dilihat dari file reading_data.csv. Menggunakan condition IF
```sh
awk -F, '
BEGIN { }
NR==1 { next }
{
    if ($9 == "Asia" && $5 > "2023-12-31") 
        genre[$4]++;
}
END { 
    max=0;
    pop_genre = "Tidak ada data";

    for (g in genre) {
        if (genre[g] > max) { 
            max = genre[g]; 
            pop_genre = g; 
        }
    }

    if (max > 0) 
        print "Genre paling populer di Asia setelah 2023 adalah", pop_genre, "dengan", max, "buku.";
    else 
        print "Tidak ada data genre di Asia setelah 2023.";
}
' reading_data.csv
```
Pada shell di atas ini, poin ini mencari genre paling populer di Asia setelah 2023, genre populer ini dicari berdasarkan file reading_data.csv. Menggunakan condition IF
![Alt text](https://github.com/RafiwS/Sisop-Modul-1-2025-IT22/issues/2#issue-2935568004)

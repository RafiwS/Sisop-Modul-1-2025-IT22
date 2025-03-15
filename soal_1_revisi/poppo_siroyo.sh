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


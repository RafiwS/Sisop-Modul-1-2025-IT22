awk -F, '
BEGIN { count=0 } 
$2 == "Chris Hemsworth" { count++ } 
END { print "Chris Hemsworth membaca", count, "buku." }
' reading_data.csv

awk -F, '
BEGIN { sum=0; count=0 } 
$8 == "Tablet" { sum += $6; count++ } 
END { 
    if (count > 0) 
        printf "Rata-rata durasi membaca dengan Tablet adalah %.2f menit\n", sum/count; 
}
' reading_data.csv

awk -F, '
BEGIN { max=0 }
NR == 1 { next } 
$7 > max { max=$7; name=$2; book=$3 }
END { print "Pembaca dengan rating tertinggi:", name, "-", book, "-", max }
' reading_data.csv

awk -F, '
BEGIN { }
NR==1 { next }
$9 == "Asia" && $5 > "2023-12-31" { genre[$4]++ }
END { 
    max=0;
    for (g in genre) if (genre[g] > max) { max=genre[g]; pop_genre=g }
    print "Genre paling populer di Asia setelah 2023 adalah", pop_genre, "dengan", max, "buku."
}
' reading_data.csv

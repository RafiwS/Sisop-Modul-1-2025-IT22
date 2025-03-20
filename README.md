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

BERIKUT OUTPUT DARI 4 POIN DI ATAS
![Image](https://github.com/user-attachments/assets/d3569dae-56f8-495e-821b-3d62b26aedea)

#Soal no 2
1. Di soal no 2 kita diminta untuk membuat 2 fungsional shell login dan register menggunakan nano.
Berikut tampilan nano login.sh
```sh
   #!/bin/bash
DB_FILE="./data/player.csv"
SALT="some_random_static_salt"  # Static salt untuk hashing password

if [ ! -f "$DB_FILE" ]; then
    echo "Database tidak ditemukan. Pastikan file /data/player.csv ada."
    exit 1
fi

validate_email() {
    if [[ ! "$1" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Email tidak valid. Pastikan formatnya benar (misalnya user@example.com)."
        return 1
    fi
    return 0
}

read -p "Masukkan email: " email

validate_email "$email" || exit 1

read -sp "Masukkan password: " password
echo

hashed_password=$(echo -n "$password$SALT" | sha256sum | awk '{print $1}')
```

Tampilan nano register.sh
```sh
#!/bin/bash

DB_FILE="./data/player.csv"
SALT="some_random_static_salt"  # Static salt untuk hashing password

if [ ! -f "$DB_FILE" ]; then
    echo "Database tidak ditemukan. Pastikan file /data/player.csv ada."
    exit 1
fi

validate_email() {
    if [[ ! "$1" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Email tidak valid. Pastikan formatnya benar (misalnya user@example.com)."
        return 1
    fi
    return 0
}

read -p "Masukkan email: " email

validate_email "$email" || exit 1

read -sp "Masukkan password: " password
echo

hashed_password=$(echo -n "$password$SALT" | sha256sum | awk '{print $1}')
```

Lalu untuk pemantauan sumber daya kita membuat core_monitor.sh dan frag_monitor.sh
Tampilan code core_monitor.sh 
```sh
#!/bin/bash

DB_FILE="./data/player.csv"
SALT="some_random_static_salt"  # Static salt untuk hashing password

if [ ! -f "$DB_FILE" ]; then
    echo "Database tidak ditemukan. Pastikan file /data/player.csv ada."
    exit 1
fi

validate_email() {
    if [[ ! "$1" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Email tidak valid. Pastikan formatnya benar (misalnya user@example.com)."
        return 1
    fi
    return 0
}

read -p "Masukkan email: " email

validate_email "$email" || exit 1

read -sp "Masukkan password: " password
echo

hashed_password=$(echo -n "$password$SALT" | sha256sum | awk '{print $1}')
```

Tampilan code frag_monitor.sh
```sh
#!/bin/bash

DB_FILE="./data/player.csv"
SALT="some_random_static_salt"  # Static salt untuk hashing password

if [ ! -f "$DB_FILE" ]; then
    echo "Database tidak ditemukan. Pastikan file /data/player.csv ada."
    exit 1
fi

validate_email() {
    if [[ ! "$1" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Email tidak valid. Pastikan formatnya benar (misalnya user@example.com)."
        return 1
    fi
    return 0
}

read -p "Masukkan email: " email

validate_email "$email" || exit 1

read -sp "Masukkan password: " password
echo

hashed_password=$(echo -n "$password$SALT" | sha256sum | awk '{print $1}')
```

Untuk menambahkan dan memonitoring CPU menggunakan crontab manager yaitu manager.sh
Tampilan code
```sh
#!/bin/bash

DB_FILE="./data/player.csv"
SALT="some_random_static_salt"  # Static salt untuk hashing password

if [ ! -f "$DB_FILE" ]; then
    echo "Database tidak ditemukan. Pastikan file /data/player.csv ada."
    exit 1
fi

validate_email() {
    if [[ ! "$1" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Email tidak valid. Pastikan formatnya benar (misalnya user@example.com)."
        return 1
    fi
    return 0
}

read -p "Masukkan email: " email

validate_email "$email" || exit 1

read -sp "Masukkan password: " password
echo

hashed_password=$(echo -n "$password$SALT" | sha256sum | awk '{print $1}')
```
Revisi untuk manager.sh adalah seharusnya hanya 3 menu akan tetapi aku memasukkan satu menu sehingga sudah aku ubah untuk hanya 3 menu.

Output login.sh dan register.sh
![Image](https://github.com/user-attachments/assets/3aaa74cd-d638-417d-8b86-b216085676a0)


Output manager.sh
![Image](https://github.com/user-attachments/assets/4bf5a750-245d-4101-ac9a-d8d4d7d3a959)

#Soal no 3
1. Di soal nomor 3 ini, kita diminta untuk membuat sebuah script atas 5 tema dari 10 lagu dalam album. 5 tema tersebut antara lain : Speak to Me, On the Run, Time, Money, dan Brain Damage.

2. Untuk Speak to Me, kita akan memanggil API dari https://github.com/annthurium/affirmations untuk menampilkan word of affirmation setiap detik.
```sh
speak_to_me() {
    echo "Starting Speak to Me..."
    while true; do
        affirmation=$(curl -s https://www.affirmations.dev | jq -r '.affirmation')
        echo -e "\033[1;32m$affirmation\033[0m"
        sleep 1
    done
}
```
Ketika script diatas dipanggil, setelah memanggil API dari link tersebut dengan curl, data json akan diekstrak menggunakan jq. script "\033[1;32m$affirmation\033[0m" berfungsi untuk menghasilkan teks berwarna hijau. Sleep 1 digunakan agar loop dilakukan setiap 1 detik.
![Image](https://github.com/user-attachments/assets/c64a2557-e1e4-4163-bd22-1ce56679b5e7)


3. Untuk On the Run, kita diminta untuk membuat progress bar dengan waktu yang tak tentu atau acak (random).
```sh
on_the_run() {
    echo "Starting On the Run..."
    sleep 1
    echo "Ready, set, go!"
    sleep 1

    TERM_WIDTH=$(tput cols)
    BAR_LENGTH=$((TERM_WIDTH - 12))

    echo -ne "["
    for ((i=0; i<=100; i++)); do
        PROGRESS=$((i * BAR_LENGTH / 100))
        BAR=$(printf "%-${PROGRESS}s" "#" | tr ' ' '#')

        printf "\r[%-*s] %3d%%" "$BAR_LENGTH" "$BAR" "$i"

        sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
    done
    echo -e "\nFinished!"
}
```
Dalam script ini, Progress bar akan ditentukan pada line "TERM_WIDTH=$(tput cols)" dan "BAR_LENGTH=$((TERM_WIDTH - 12))". Selanjutnya, " PROGRESS=$((i * BAR_LENGTH / 100))" berfungsi untuk menghitung panjang progress bar berdasarkan persentase, lalu dilanjutkan dengan "BAR=$(printf "%-${PROGRESS}s" "#" | tr ' ' '#')" untuk membuat string dengan jumlah # sesuai panjang "PROGRESS". " sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')" digunakan untuk menghitung waktu tidur acak antara 0.1 hingga 1 detik untuk membuat efek kecepatan progress bar yang tidak seragam.
![Image](https://github.com/user-attachments/assets/1f8cdcc9-becc-48c6-8d0e-bb403b5d8ef2)

4. Pada Time, kita diminta untuk menampilkan live clock yang menunjukkan tanggal, jam, menit, dan detik.
```sh
time_func() {
    echo "Starting Time..."
    while true; do
        clear
        echo -e "\033[1;34m$(date '+%A, %d %B %Y')\033[0m"
        echo -e "\033[1;32m$(date '+%H:%M:%S')\033[0m"
        sleep 1
    done
}
```
Dengan script tersebut, tanggal akan ditampilkan dengan urutan "Hari, Tanggal Bulan Tahun" Kemudian dilanjutkan dengan live clock dibawahnya. Untuk hari, tanggal, bulan, dan tahun menggunakan ANSI berwarna biru, sedangkan untuk live clock menggunakan warna hijau.
![Image](https://github.com/user-attachments/assets/05da5197-de88-4754-ad5b-3ef0e0e41758)

5. Pada Money, kita diminta untuk menampilkan simbol mata uang seperti $ € £ ¥ ¢ ₹ ₩ ₿ ₣ secara acak.
```sh
money() {
    echo "Starting Money..."
    sleep 1
    clear

    CURRENCY=("€" "£" "$" "¥" "₩" "₹" "₽" "₺" "₦" "฿")
    TERM_WIDTH=$(tput cols)
    TERM_HEIGHT=$(tput lines)

    while true; do
        clear
        for ((i=0; i<TERM_HEIGHT; i++)); do
            LINE=$(printf "%*s" "$TERM_WIDTH" "")

            for ((j=0; j<TERM_WIDTH; j++)); do
                if (( RANDOM % 30 == 0 )); then
                    SYMBOL="${CURRENCY[RANDOM % ${#CURRENCY[@]}]}"
                    LINE=$(echo "$LINE" | sed "s/./$SYMBOL/$((j+1))")
                fi
            done

            echo "$LINE"
        done
        sleep 0.1
    done
}
```
- "CURRENCY=("€" "£" "$" "¥" "₩" "₹" "₽" "₺" "₦" "฿")
    TERM_WIDTH=$(tput cols)
    TERM_HEIGHT=$(tput lines)"
  script tersebut digunakan untuk menentukan simbol mata uang dan ukuran terminal (lebar & tinggi).
- Lalu dilakukan loop tak terbatas untuk menampilkan mata uang secara acak dalam posisi acak juga.
![Image](https://github.com/user-attachments/assets/1a8ec7b6-1048-4af0-b7a4-3379811e5181)

6. Pada Brain Damage, kita diminta untuk menampilkan proses yang sedang berjalan, mirip seperti task manager.
```sh
brain_damage() {
    echo "Starting Brain Damage..."
    sleep 1
    top
}
if [[ $# -eq 0 ]]; then
    echo "Usage: ./dsotm.sh --play=\"<Track>\""
    exit 1
fi
```
Kode ini memastikan bahwa pengguna memasukkan minimal satu argumen saat menjalankan script. Jika tidak, script akan menampilkan cara penggunaan yang benar lalu keluar dengan status error.
![Image](https://github.com/user-attachments/assets/d71eb9d3-3b63-4e4c-a189-f5c900f643bb)


7. Pada
```sh
case "$1" in
    --play=*)
        TRACK="${1#*=}"
        ;;
    *)
        echo "Unknown option: $1"
        exit 1
        ;;
esac

case $TRACK in
    "Speak to Me")
        speak_to_me
        ;;
    "On the Run")
        on_the_run
        ;;
    "Time")
        time_func
        ;;
    "Money")
        money
        ;;
    "Brain Damage")
        brain_damage
        ;;
    *)
        echo "Track '$TRACK' not implemented yet."
        exit 1
        ;;
esac
```
Program akan mengecek opsi yang diberikan oleh user. Setelah itu, program akan mengeksekusi fungsi sesuai lagu yang dipilih. Jika lagu tidak dikenali atau input yang diberikan tidak sesuai, script akan menampilkan pesan error.

#Soal no 4
1. Pada soal ini kita diputuskan untuk membuat shell untuk membaca sebuah data dari banyak nya pokemon yang ada di data tersebut
2. Dengan menggunakan shell, di sini kita akan membaca file .csv untuk summary data, sorting pokemon, mencari pokemon tertentu, mencari dengan filter name type, error handling, dan --help

1. Pada display info berikut kita akan membuat display info summary terkait dengan beberapa data dari file .csv menggunakan shell untuk mencari summary dengan data terbesar $HIGHEST_USAGE
```sh
display_info() {
    echo "🔥 Summary of $FILE 🔥"
    HIGHEST_USAGE=$(tail -n +2 "$FILE" | sort -t, -k2 -nr | head -1)
    POKEMON_USAGE=$(echo "$HIGHEST_USAGE" | cut -d, -f1)
    USAGE_PERCENT=$(echo "$HIGHEST_USAGE" | cut -d, -f2)
    HIGHEST_RAW_USAGE=$(tail -n +2 "$FILE" | sort -t, -k3 -nr | head -1)
    POKEMON_RAW=$(echo "$HIGHEST_RAW_USAGE" | cut -d, -f1)
    RAW_USAGE=$(echo "$HIGHEST_RAW_USAGE" | cut -d, -f3)
    echo "-------------------------------------------"
    echo "🚀 The most terrifying Pokémon in Gen 9 OU!"
    echo "👑 Highest Adjusted Usage: $POKEMON_USAGE with $USAGE_PERCENT%"
    echo "📊 Highest Raw Usage: $POKEMON_RAW with $RAW_USAGE uses"
    echo "-------------------------------------------"
}
```
![Image](https://github.com/user-attachments/assets/0189cd20-1fd2-4d98-a1c4-6c0637171dcb)

2. Pada poin sorting berikut kita akan membuat sorting data terkait dengan file .csv, di poin ini kita akan mencari usage, raw, name, hp, atk, def, spatk, spdef, speed. Jika terdapat error maka akan print out invalid sort column jika ./pokemon_analysis.sh pokemon_usage.csv --sort <kosong> 
```sh
sort_pokemon() {
    COLUMN=$3
    HEADER=$(head -1 "$FILE")
    SORTED_DATA=$(tail -n +2 "$FILE" | sort -t, -k1,1 -k2,2nr)
    case $COLUMN in
        usage) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k2 -nr);;
        raw) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k3 -nr);;
        name) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k1);;
        hp) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k6 -nr);;
        atk) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k7 -nr);;
        def) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k8 -nr);;
        spatk) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k9 -nr);;
        spdef) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k10 -nr);;
        speed) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k11 -nr);;
        *) echo "Error: Invalid sort column '$COLUMN'"; exit 1;;
    esac
    echo "$HEADER"
    echo "$SORTED_DATA"
}
```
![Image](https://github.com/user-attachments/assets/c9aae3ab-4075-423d-9720-1ced57c1215f)

3. Pada poin ini membuat search terkait dengan $NAME dari pokemon yang akan kita cari dari file .csv tersebut
```sh
search_pokemon() {
    NAME=$3
    HEADER=$(head -1 "$FILE")
    RESULT=$(awk -F, -v name="$NAME" 'NR==1 || tolower($1) ~ tolower(name)' "$FILE")
    if [[ -z "$(echo "$RESULT" | tail -n +2)" ]]; then
        echo "Error: No Pokémon named '$NAME' found."
        exit 1
    fi
    echo "$RESULT"
}
```
![Image](https://github.com/user-attachments/assets/670bddf2-bb58-4cb1-a931-6ee4643e2cac)

4. Pada poin ini kita akan menfilter pokemon sesuai dengan elemen masing masing
```sh
filter_pokemon() {
    TYPE=$3
    HEADER=$(head -1 "$FILE")
    RESULT=$(awk -F, -v type="$TYPE" 'NR==1 || tolower($4) == tolower(type) || tolower($5) == tolower(type)' "$FILE")
    if [[ -z "$(echo "$RESULT" | tail -n +2)" ]]; then
        echo "Error: No Pokémon of type '$TYPE' found."
        exit 1
    fi
    echo "$RESULT"
}
```
![Image](https://github.com/user-attachments/assets/7db33078-be71-45c6-bedc-df14aa8d0efa)

5. Pada poin ini kita akan membuat error handling jika command yang diberikan tidak sesuai dengan command execute nano
```sh
case $COMMAND in
    --info) display_info;;
    --sort) 
        if [[ $# -lt 3 ]]; then
            echo "Error: No sort column provided"
            exit 1
        fi
        sort_pokemon "$@";;
    --grep) 
        if [[ $# -lt 3 ]]; then
            echo "Error: No Pokémon name provided"
            exit 1
        fi
        search_pokemon "$@";;
    --filter) 
        if [[ $# -lt 3 ]]; then
            echo "Error: No filter type provided"
            exit 1
        fi
        filter_pokemon "$@";;
    *) echo "Error: Unknown command '$COMMAND'"; exit 1;;
esac
```
![Image](https://github.com/user-attachments/assets/b60b4683-d66a-45ae-8a5b-a424d5d16df5)

6. Pada poin terakhir, script berikut akan membuat --help jika kita mengetahui command apa saja yang berada pada file nano tersebut untuk diexecute
```sh
if [[ $# -eq 1 && ($1 == "-h" || $1 == "--help") ]]; then
    cat << "EOF"
    ██████╗  ██████╗ ██╗  ██╗███████╗███╗   ███╗ ██████╗ ███╗   ██╗
    ██╔══██╗██╔═══██╗██║ ██╔╝██╔════╝████╗ ████║██╔═══██╗████╗  ██║
    ██████╔╝██║   ██║█████╔╝ █████╗  ██╔████╔██║██║   ██║██╔██╗ ██║
    ██╔═══╝ ██║   ██║██╔═██╗ ██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║
    ██║     ╚██████╔╝██║  ██╗███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
    ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ 
    Pokemon Usage Analysis Script - Gen 9 OverUsed
    ---------------------------------------------------------
    Usage:
    ./pokemon_analysis.sh <file.csv> --info          Show data summary
    ./pokemon_analysis.sh <file.csv> --sort <column> Sort Pokémon by column
    ./pokemon_analysis.sh <file.csv> --grep <name>   Search Pokémon by name
    ./pokemon_analysis.sh <file.csv> --filter <type> Filter Pokémon by type
    ./pokemon_analysis.sh -h | --help                Show this help screen
    ---------------------------------------------------------
EOF
    exit 0
fi

if [[ $# -lt 2 ]]; then
    echo "Error: Not enough arguments. Use -h or --help for usage details."
    exit 1
fi

FILE=$1
COMMAND=$2
```
![Image](https://github.com/user-attachments/assets/76238f76-7809-46f6-9e21-3c9b84f26972)

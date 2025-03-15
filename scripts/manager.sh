#!/bin/bash

CRON_TAB_PATH="/var/spool/cron/crontabs/$(whoami)"
LOG_FILE="./log/crontab.log"

U
add_cpu_monitor() {
    echo "Menambahkan pemantauan CPU setiap 5 menit..."
    (crontab -l 2>/dev/null; echo "*/5 * * * * /path/to/scripts/core_monitor.sh") | crontab -
    echo "$(date) - Menambahkan pemantauan CPU" >> "$LOG_FILE"
}


remove_cpu_monitor() {
    echo "Menghapus pemantauan CPU..."
    crontab -l | grep -v "core_monitor.sh" | crontab -
    echo "$(date) - Menghapus pemantauan CPU" >> "$LOG_FILE"
}


add_ram_monitor() {
    echo "Menambahkan pemantauan RAM setiap 5 menit..."
    (crontab -l 2>/dev/null; echo "*/5 * * * * /path/to/scripts/frag_monitor.sh") | crontab -
    echo "$(date) - Menambahkan pemantauan RAM" >> "$LOG_FILE"
}


remove_ram_monitor() {
    echo "Menghapus pemantauan RAM..."
    crontab -l | grep -v "frag_monitor.sh" | crontab -
    echo "$(date) - Menghapus pemantauan RAM" >> "$LOG_FILE"
}


view_active_jobs() {
    echo "Menampilkan pekerjaan aktif di crontab..."
    crontab -l
}


echo "Pilih opsi:"
echo "1) Tambah Pemantauan CPU"
echo "2) Hapus Pemantauan CPU"
echo "3) Tambah Pemantauan RAM"
echo "4) Hapus Pemantauan RAM"
echo "5) Lihat Pekerjaan Aktif"
echo "6) Keluar"

read -p "Pilih nomor opsi: " option

case $option in
    1) add_cpu_monitor ;;
    2) remove_cpu_monitor ;;
    3) add_ram_monitor ;;
    4) remove_ram_monitor ;;
    5) view_active_jobs ;;
    6) exit 0 ;;
    *) echo "Pilihan tidak valid." ;;
esac


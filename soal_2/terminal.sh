
echo "Selamat datang di dunia Arcaea!"
echo "Pilih opsi:"
echo "1) Registrasi"
echo "2) Login"
echo "3) Manajemen Crontab"
echo "4) Keluar"

read -p "Pilih nomor opsi: " option

case $option in
    1) ./register.sh ;;
    2) ./login.sh ;;
    3) ./scripts/manager.sh ;;
    4) exit 0 ;;
    *) echo "Pilihan tidak valid." ;;
esac

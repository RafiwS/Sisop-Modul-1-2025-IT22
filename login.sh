DB_FILE="/data/player.csv"
SALT="some_random_static_salt"

if [ ! -f "$DB_FILE" ]; then
   echo "Database tidak ditemukan. Pastikan file /data/player.csv ada."
   exit 1
fi

read -p "Masukkan email: " email
read -sp "Masukkan password: " password
echo

hashed_password=$(echo -n "$password$SALT" | sha256sum | awk '{print $1}'


if grep -q "^$email,$password" "$DB_FILE"; then
    echo "Login berhasil! Welcome, $email."
else
    echo "Email atau password salah. Coba lagi."
fi


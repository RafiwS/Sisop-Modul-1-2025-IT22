DB FILE="/data/player.csv"
SALT="some_random_static_salt"

if [ ! -f "$DB_FILE" ]; then
    echo "email,username,password" > "$DB_FILE"
fi

read -p "Masukkan email: " email
read -p "Masukkan username: " username
read -sp "Masukkan password: " password
echo

if grep -q "^$email," "$DB_FILE"; then
    echo "Email sudah terdaftar. silahkan pilih email lain."
    exit 1
fi

echo "$email,$username,$password" >> "$DB_FILE"
echo "Registrasi berhasil! Akun anda telah dibuat."

hashed_password=$(echo -n "$password$SALT" | sha256sum | awk '{print $1}')

echo "$email,$username,$hashed_password" >> "$DB_FILE"
echo "Registrasi berhasil!"


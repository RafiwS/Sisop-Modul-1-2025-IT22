#!/bin/bash

DB_FILE="/data/player.csv"
SALT="some_random_static_salt"

if [ ! -f "$DB_FILE" ]; then
    echo "email,username,password" > "$DB_FILE"
fi

validate_email() {
    if [[ ! "$1" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Email tidak valid. Pastikan formatnya benar (misalnya user@example.com)."
        return 1
    fi
    return 0
}

validate_password() {
    if [[ ! "$1" =~ ^.*[a-z].*$ || ! "$1" =~ ^.*[A-Z].*$ || ! "$1" =~ ^.*[0-9].*$ || ${#1} -lt 8 ]]; then
        echo "Password harus minimal 8 karakter, mengandung huruf kecil, huruf besar, dan angka."
        return 1
    fi
    return 0
}

read -p "Masukkan email: " email

validate_email "$email" || exit 1

if grep -q "^$email," "$DB_FILE"; then
    echo "Email sudah terdaftar. Silakan pilih email lain."
    exit 1
fi

read -p "Masukkan username: " username
read -sp "Masukkan password: " password
echo

validate_password "$password" || exit 1

hashed_password=$(echo -n "$password$SALT" | sha256sum | awk '{print $1}')

echo "$email,$username,$hashed_password" >> "$DB_FILE"
echo "Registrasi berhasil! Akun Anda telah dibuat."

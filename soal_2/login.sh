#!/bin/bash

DB_FILE="/data/player.csv"
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

if grep -q "^$email,$hashed_password" "$DB_FILE"; then
    echo "Login berhasil! Selamat datang, $email."
else
    echo "Email atau password salah. Silakan coba lagi."
fi

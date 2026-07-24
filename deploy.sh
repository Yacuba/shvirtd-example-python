#!/bin/bash
set -e

REPO_URL="https://github.com/Yacuba/shvirtd-example-python.git"
TARGET_DIR="/opt/shvirtd-example-python"

echo "=== Запуск развертывания проекта ==="

if [ -d "$TARGET_DIR" ]; then
    echo "Каталог $TARGET_DIR уже существует. Обновляем репозиторий..."
    cd "$TARGET_DIR"
    git pull origin main
else
    echo "Клонируем форк-репозиторий в $TARGET_DIR..."
    sudo git clone "$REPO_URL" "$TARGET_DIR"
    cd "$TARGET_DIR"
fi

echo "Запускаем Docker Compose стек..."
sudo docker compose up -d

echo "=== Развертывание успешно завершено ==="

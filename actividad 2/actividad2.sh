#!/bin/bash

read -p "Ingrese su nombre de usuario de GitHub: " GITHUB_USER

API_URL="https://api.github.com/users/"
USER_INFO=$(curl -s "${API_URL}${GITHUB_USER}")
# Extraer los datos relevantes del JSON recibido
USER_ID=$(echo "$USER_INFO" | grep -Po '"id": \K\d+')
CREATED_AT=$(echo "$USER_INFO" | grep -Po '"created_at": "\K[^"]+')
# Crear la cadena
MESSAGE="Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."

# Crear la carpeta
LOG_DIR="/tmp/$(date +%Y%m%d)"
mkdir -p "$LOG_DIR"

# Crear el archivo de log en /tmp/<fecha>/saludos.log
LOG_FILE="$LOG_DIR/saludos.log"
echo "$MESSAGE" > "$LOG_FILE"

# Imprimir el mensaje en la consola
echo "$MESSAGE"
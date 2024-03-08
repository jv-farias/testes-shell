#!/bin/bash

# Encontrar o caminho do arquivo APK na pasta atual
apk_path=$(find . -name "*.apk" -type f)

# Verificar se o arquivo APK foi encontrado
if [ -z "$apk_path" ]; then
    echo "Nenhum arquivo APK encontrado na pasta atual."
    exit 1
fi

# Extrair apenas o nome do arquivo APK (sem o caminho completo) para uso posterior
apk_filename=$(basename "$apk_path")

# Imprimir o nome do arquivo APK encontrado
echo "Arquivo APK encontrado: $apk_filename"

# Esperar até que o ADB esteja pronto e o emulador seja carregado
echo "Esperando o ADB estar pronto e o emulador carregar..."
until adb devices | grep 'device$'; do
    echo "Aguardando o emulador..."
    sleep 10
done

echo "Emulador carregado e pronto."
sleep 20 

echo "Instalando APK..."
adb install "$apk_path"
echo "APK instalado com sucesso."


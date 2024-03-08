#!/bin/bash


echo "Escolha o aparelho de emulador:"
echo "1. Nexus 5"
echo "2. Pixel 3"
read opcao

case $opcao in
    1)
        echo "Iniciando emulador Nexus 5..."
        # Comando para iniciar emulador Nexus 5
        ;;
    2)
        echo "Iniciando emulador Pixel 3..."
        # Comando para iniciar emulador Pixel 3
        ;;
    *)
        echo "Opção inválida."
        ;;
esac

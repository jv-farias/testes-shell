#!/bin/bash

echo "Construindo a imagem Docker..."
docker build -t minha-imagem-android .

echo "Escolha o aparelho do emulador:"
echo "1. Samsung Galaxy S10 - PC com mais performance"
echo "2. Samsung Galaxy S6 - PC com menor performance"
read optionDevice

case $optionDevice in
    1)
        echo "Iniciando contêiner com Samsung Galaxy S10..."
        docker run -d -p 6080:6080 -p 9999:9999 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=true --device /dev/kvm --name android-container minha-imagem-android
        ;;
    2)
        echo "Iniciando contêiner com Samsung Galaxy S6..."
        docker run -d -p 6080:6080 -p 9999:9999 -e EMULATOR_DEVICE="Samsung Galaxy S6" -e WEB_VNC=true --device /dev/kvm --name android-container minha-imagem-android
        ;;
    *)
        echo "Opção inválida."
        ;;
esac

echo "Aguardando o contêiner inicializar..."
sleep 90

echo "Executando script start.sh no contêiner..."
docker exec android-container /bin/bash -c "/home/androidusr/start.sh"

# Aguardar um momento para garantir que a APK foi instalada e o ambiente está pronto
echo "Esperando o ambiente estar completamente pronto..."
sleep 10

echo "Executando script de teste run_test.sh no contêiner..."
docker exec android-container /bin/bash -c "/home/androidusr/run_test.sh 'hml704appsPro'"

echo "Deploy e execução concluídos."


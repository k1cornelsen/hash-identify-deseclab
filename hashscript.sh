#!/bin/bash

# Verifica se o número de argumentos está correto
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <hash>"
    exit 1
fi

# Hash definido pelo usuário
hash_usuario="$1"

# Verifica se o arquivo existe
if [ -f "john.txt" ]; then
    # Loop para ler cada palavra do arquivo
    while IFS= read -r palavra; do
        # Exibe a palavra sendo testada
        echo "Testando palavra: $palavra"
        resultado=$(echo -n "$palavra" | md5sum | base64 | sha1sum)
        echo "$resultado" >> saida.txt
        if [ "$resultado" == "$hash_usuario  -" ]; then
            echo "Hash encontrado para a palavra: $palavra"
            exit 0 # Termina o script após encontrar a correspondência
        fi
    done < "/usr/share/john/password.lst"
    echo "Fim do arquivo. Hash não encontrado."
else
    echo "O arquivo /usr/share/john/password.lst não existe."
fi


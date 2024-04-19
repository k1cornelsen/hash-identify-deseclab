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
        
        # Calcula o hash MD5 da palavra
        md5_hash=$(echo -n "$palavra" | md5sum | awk '{print $1}')
        
        # Converte o hash MD5 para base64
        base64_hash=$(echo -n "$md5_hash" | base64)
        
        # Calcula o hash SHA1 do hash base64
        sha1_hash=$(echo -n "$base64_hash" | sha1sum | awk '{print $1}')
        
        # Compara o hash SHA1 calculado com o hash fornecido pelo usuário
        if [ "$sha1_hash" == "$hash_usuario" ]; then
            echo "Hash encontrado para a palavra: $palavra"
            exit 0 # Termina o script após encontrar a correspondência
        fi
    done < "john.txt"
    echo "Fim do arquivo. Hash não encontrado."
else
    echo "O arquivo john.txt não existe."
fi


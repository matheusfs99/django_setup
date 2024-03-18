#!/usr/bin/env bash

SECRET_KEY=$(python3 -c "from scripts.secret_gen import secret_gen; print(secret_gen())")

if [ -f ".env" ]; then
    if grep -q "^SECRET_KEY=" ".env"; then
        sed -i.bkp "s|^SECRET_KEY=.*|SECRET_KEY=$SECRET_KEY|" ".env"
    else
        echo "SECRET_KEY=$SECRET_KEY" >> ".env"
    fi

    echo "Chave secreta gerada e adicionada ao arquivo .env."
else
    echo "Erro: arquivo .env não encontrado no diretório raiz."
fi

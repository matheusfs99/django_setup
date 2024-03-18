#!/usr/bin/env bash

SECRET_KEY=$(python -c "from secret_gen import secret_gen; print(secret_gen())")

if grep -q "^SECRET_KEY=" .env; then
    sed -i "s|^SECRET_KEY=.*|SECRET_KEY=\"$SECRET_KEY\"|" .env
else
    echo "SECRET_KEY=\"$SECRET_KEY\"" >> .env
fi

echo "Chave secreta gerada e adicionada ao arquivo .env."
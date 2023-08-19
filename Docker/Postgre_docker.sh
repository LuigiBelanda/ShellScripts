#!/bin/bash

# Função para baixar a imagem mais recente do PostgreSQL Alpine
baixar_postgres() {
    docker pull postgres:alpine
}

# Função para parar e remover o container do PostgreSQL se já estiver em execução
parar_e_remover_container() {
    CONTAINER_NAME="Postgres"
    if docker ps -a | grep -q "$CONTAINER_NAME"; then
        docker stop "$CONTAINER_NAME" &>/dev/null
        docker rm "$CONTAINER_NAME" &>/dev/null
    fi
}

# Função para executar o container do PostgreSQL
executar_container() {
    # Definindo a senha do PostgreSQL
    POSTGRES_PASSWORD="postgres"

    # Verificando se a imagem já foi baixada, senão baixa
    if ! docker image ls | grep -q "postgres.*alpine"; then
        baixar_postgres
    fi

    # Parar e remover o container se já estiver em execução
    parar_e_remover_container

    # Executando o container
    docker run -d \
        -p 5432:5432 \
        --name Postgres \
        -e POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
        postgres:alpine
}

# Executar a função para criar e executar o container
executar_container

# Verificar se o container está em execução
CONTAINER_NAME="Postgres"
if docker ps | grep -q "$CONTAINER_NAME"; then
    echo "Container Postgres em execução na porta 5432 com a senha do root definida como 'postgres'."
else
    echo "Falha ao executar o container Postgres."
fi


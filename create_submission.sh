#!/bin/bash

# Verifica che venga passato un parametro
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <name>"
    exit 1
fi

# Nome dello zip da creare
NAME=$1
ZIP_PATH="/opt/llm/submissions/$NAME.zip"

# Percorsi dei file e delle cartelle da includere
USER_DIR="user/"
USER_PY="lm-evaluation-harness/lm_eval/models/user.py"

# Verifica che i file e le cartelle esistano
if [ ! -d "$USER_DIR" ]; then
    echo "Error: Directory $USER_DIR does not exist."
    exit 1
fi

if [ ! -f "$USER_PY" ]; then
    echo "Error: File $USER_PY does not exist."
    exit 1
fi

# Crea la directory submissions se non esiste
mkdir -p /opt/llm/submissions

# Crea una directory temporanea per preparare il contenuto dello zip
TEMP_DIR=$(mktemp -d)
cp -r "$USER_DIR" "$TEMP_DIR/"
cp "$USER_PY" "$TEMP_DIR/"

cd "$TEMP_DIR"
zip -r "$ZIP_PATH" "user.py" "user"

# Rimuove la directory temporanea
rm -rf "$TEMP_DIR"

cd "/opt/llm/"

# Verifica che lo zip sia stato creato con successo
if [ $? -eq 0 ]; then
    echo "Archive created successfully: $ZIP_PATH"
else
    echo "Error creating archive."
    exit 1
fi

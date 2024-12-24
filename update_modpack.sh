#!/bin/bash

# Définir le répertoire du projet
PROJECT_DIR="$(dirname "$0")"
ARCHIVE_NAME="ValheimUltimateQoLAdventure.zip"

# Vérifier si le répertoire existe
if [ ! -d "$PROJECT_DIR" ]; then
  echo "Erreur : Le répertoire $PROJECT_DIR n'existe pas."
  exit 1
fi

# Se déplacer dans le répertoire du projet
cd "$PROJECT_DIR" || exit

# Créer un fichier ZIP en excluant les fichiers et répertoires à ignorer
echo "Création de l'archive ZIP..."

# Utilisation de zip avec des options pour ignorer certains fichiers et répertoires
zip -r "$ARCHIVE_NAME" . \
  -x "*.git*" -x "*.gitattributes" -x "./update_modpack.sh"

# Vérifier si la création de l'archive a réussi
if [ $? -eq 0 ]; then
  echo "L'archive $ARCHIVE_NAME a été créée avec succès."
else
  echo "Une erreur est survenue lors de la création de l'archive."
fi

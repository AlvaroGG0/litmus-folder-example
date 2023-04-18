#!/bin/bash

# Nombre de usuario del repo de Github
github_user="AlvaroGG0"

# Nombre del repositorio de Github
github_repo="litmus-folder-example"

# Ruta en el repositorio de los archivos a descargar (p.ej. "ruta/a/los/archivos")
github_path="./scenarios"

download_folder="$(mktemp -d)"

# Descargar el árbol de archivos en formato JSON
json_tree=$(curl -s https://api.github.com/repos/$github_user/$github_repo/git/trees/master?recursive=1)

# Filtrar los archivos en la ruta especificada
filtered_files=$(echo "$json_tree" | jq --arg path "$github_path" '.tree[] | select(.path | startswith($path)) | select(.type == "blob") | select(.path | endswith(".yml", ".yaml")) | .path')

# Descargar cada escenario en una carpeta separada según su entorno objetivo
for file_path in $filtered_files
do
  dir_name="$(dirname "$file_path")"
  sub_dir_name="$(basename "$dir_name")"
  mkdir -p "$download_folder/$sub_dir_name"
  file_url="https://raw.githubusercontent.com/$github_user/$github_repo/master/$file_path"
  curl -s -o "$download_folder/$sub_dir_name/$(basename "$file_path")" "$file_url"
done

# Recorrer todos los archivos descargados
for sub_dir in "$download_folder"/*/
do
  sub_dir=${sub_dir%*/}
  sub_dir_name=$(basename "$sub_dir")
  for downloaded_file in "$sub_dir"/*.yaml "$sub_dir"/*.yml
  do
    echo "Procesando archivo en subdirectorio $sub_dir_name: $downloaded_file"
    
  done
done

read -p "Presiona ENTER para eliminar la carpeta temporal de descargas $download_folder..." -r
# Eliminar la carpeta temporal
rm -rf "$download_folder"

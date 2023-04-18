#!/bin/bash

github_org="masmovil"
github_repo="infrastructure"
github_path="ruta/a/los/archivos"
github_token=""

litmus_admin_name="admin"
litmus_admin_project_id="$(litmusctl get projects -o json | jq -r '.[] | select(.Name == "'"$litmus_admin_name"'") | .ID')"

file_type="yaml"

download_folder="$(mktemp -d)"

# Descargar el árbol de archivos en formato JSON
json_tree=$(curl -s -H "Authorization: token $github_token" https://api.github.com/repos/$github_org/$github_repo/git/trees/master?recursive=1)

# Filtrar los archivos en la ruta especificada
filtered_files=$(echo "$json_tree" | grep -oP '(?<="path": ")[^"]*\.'"$file_type"'(?=")')

# Descargar cada escenario en una carpeta separada según su entorno objetivo
for file_path in $filtered_files
do
  dir_name="$(dirname "$file_path")"
  sub_dir_name="$(basename "$dir_name")"
  mkdir -p "$download_folder/$sub_dir_name"
  file_url="https://raw.githubusercontent.com/$github_org/$github_repo/master/$file_path"
  curl -s -H "Authorization: token $github_token" -o "$download_folder/$sub_dir_name/$(basename "$file_path")" "$file_url"
done

# Recorrer todos los archivos descargados
for sub_dir in "$download_folder"/*/
do
  sub_dir=${sub_dir%*/}
  sub_dir_name=$(basename "$sub_dir")
  litmus_chaos_delegate_id="$(litmusctl get chaos-delegates --project-id="$litmus_admin_project_id" -o json | jq -r '.listClusters[] | select(.clusterName == "'"$sub_dir_name"'") | .clusterID')"
  for downloaded_file in "$sub_dir"/*.yaml "$sub_dir"/*.yml
  do
    echo "Procesando archivo en subdirectorio $sub_dir_name: $downloaded_file"
    
    litmusctl create chaos-scenario -f "$downloaded_file" --project-id="$litmus_admin_project_id" --chaos-delegate-id="$litmus_chaos_delegate_id"

  done
done

# Eliminar la carpeta temporal
rm -rf "$download_folder"

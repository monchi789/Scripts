#!/bin/bash

# Esta funcion lee el parametro y te retorna el texto esperado
copy() {
  if [ "$1" = "git" ]; then
    echo "git" | xclip -selection clipboard
  else
    echo "Contenido no válido. No se copió al portapapeles."
  fi
}
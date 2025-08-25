#!/bin/bash

function show_help() {
  echo "Usage: setup.sh [OPTIONS]"
  echo "Options:"
  echo "  --help        Display this help message"
  echo "  --version     Show the script version"
  echo "  --dir=[name]  The name of the path to your repository to be inserted into templates. "
}

function split() {
  cut -d"=" -f2 <<<"$1"
}

# Check if no arguments are provided
if [ "$#" -eq 0 ]; then
  show_help
  exit 1
fi

while [[ "$1" != "" ]]; do
  case $1 in
  --help)
    show_help
    exit
    ;;
  --version)
    echo "nginx setup 1.0"
    exit
    ;;
  --dir=*)
    echo "$1"
    var=$(split "$1")

    ;;
  *)
    echo "Invalid option: $1"
    show_help
    exit 1
    ;;
  esac
  shift
done

# envsubst various files
function downloadAndTemplate() {
  local link="$1"
  local name="$2"
  local dir="$3"
  local out

  curl -o "$name" "$link" 2>/dev/null # download file, save it as name
  out=$(DIR="$dir" envsubst <"$name") # replace vars in file
  echo "$out" >"$name"                # write to file
}

echo "$var"

dir=$(cut -d"=" -f2 <<<"$var")

if
  [ "$dir" == "" ] &&
    false
then
  echo "Error Missing directory paramter"
  exit 1
fi

downloadAndTemplate "https://raw.githubusercontent.com/areon546/nginx-info/refs/heads/main/nginx/localConf.template" localConf "$dir"
downloadAndTemplate "https://raw.githubusercontent.com/areon546/nginx-info/refs/heads/main/nginx/prodConfignf.template" prodConf "$dir"
downloadAndTemplate "https://raw.githubusercontent.com/areon546/nginx-info/refs/heads/main/nginx/Makefile.template" Makefile "$dir"

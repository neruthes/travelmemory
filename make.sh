#!/bin/bash


export PATH="$PATH:$PWD/node_modules/libshneruthes/bin"

if [[ -e "$2" ]]; then
    for arg in "$@"; do
        case $PARALLEL in
            y ) ./make.sh "$arg" & ;;
            * ) ./make.sh "$arg" || exit $? ;;
        esac
    done
    [[ $PARALLEL == y ]] && wait
    exit $?
fi

case "$1" in
    *.typ )
        typst c --root . "$1" --input USE_NOTO=1
        pdf_path="${1/.typ/.pdf}"
        if [[ -e "$pdf_path" ]]; then
            dirname "_dist/$pdf_path" | xargs mkdir -p &&
            mv "$pdf_path" "_dist/$pdf_path" &&
            realpath "_dist/$pdf_path" | xargs du -h
        fi
        ;;
esac

#!/bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -s|--slides)
    SLIDES="$2"
    shift # past argument
    shift # past value
    ;;
    -t|--sections)
    SECTIONS="$2"
    shift # past argument
    shift # past value
    ;;
    # -e|--extension)
    # EXTENSION="$2"
    # shift # past argument
    # shift # past value
    # ;;
    # -s|--searchpath)
    # SEARCHPATH="$2"
    # shift # past argument
    # shift # past value
    # ;;
    # -l|--lib)
    # LIBPATH="$2"
    # shift # past argument
    # shift # past value
    # ;;
    # --default)
    # DEFAULT=YES
    # shift # past argument
    # ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

# echo SLIDES = "${SLIDES}"
# echo FILE EXTENSION  = "${EXTENSION}"
# echo SEARCH PATH     = "${SEARCHPATH}"
# echo LIBRARY PATH    = "${LIBPATH}"
# echo DEFAULT         = "${DEFAULT}"
# echo "Number files in SEARCH PATH with EXTENSION:" $(ls -1 "${SEARCHPATH}"/*."${EXTENSION}" | wc -l)
# if [[ -n $1 ]]; then
#     echo "Last line of file specified as non-opt/last argument:"
#     tail -1 "$1"
# fi


python ./makeSlides.py -s ${SLIDES} -t ${SECTIONS}

cd ./slides/"${SLIDES}"

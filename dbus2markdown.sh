#!/usr/bin/env bash

XSL_FILE='./dbus2markdown.xsl'
IN_XML_FILE=$1
OUT_MARKDOWN_FILE=$2

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <input dbus xml file> <output md file>"
  exit 1 
fi

xsltproc --novalid -o $OUT_MARKDOWN_FILE $XSL_FILE $IN_XML_FILE
sed -i 's/^ *//' $OUT_MARKDOWN_FILE # Strip indentation
sed -i 's/ *$//' $OUT_MARKDOWN_FILE # Strip trailing spaces

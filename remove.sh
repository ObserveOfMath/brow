#!/usr/bin/sh

if [[ $(whoami) != 'root' ]]; then
  printf '\033[31mERR\033[0m: Run as root.\n'
  exit 1
fi

BROW_DIR=$(cat .path | grep "^@" | sed -e "s/@//g")
ROOT_DIR=$(cat .path | grep "^#" | sed -e "s/#//g")

rm -rf $BROW_DIR
rm "$ROOT_DIR/bin/brow"
printf '\033[32mDONE\033[0m: brow was remove successfully!\n'

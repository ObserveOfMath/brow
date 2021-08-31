#!/usr/bin/sh

if [[ $(whoami) != 'root' ]]; then
  printf '\033[31mERR\033[0m: Run as root.\n'
  exit 1
fi

USER=$(getent passwd $SUDO_USER | cut -d: -f6)

# Default root directory
ROOT_DIR="/usr"

if [ $# == 1 ]; then
  if [ $1 == '--help' ]; then
    printf "\nMade by mH (https://www.github.com/observeofmath)
  \nUsage: ./install.sh [ROOT DIR] => Defaults to /usr as in /usr/bin
  \n\tMake sure the [ROOT DIR] is in the \$PATH variable below:
  \t\n$(echo $PATH | sed -e 's/:/\n/g')\n\n"
    exit 0

  # Sets a different root directory
  else
    ROOT_DIR=$1
  fi
fi

# Checks availabity of ./install.sh in current directory
DIR_GREP=$(echo $PWD | grep -e 'brow$')

if [ ! $DIR_GREP ]; then
  printf '\033[31mErr\033[0m: Need to be in the repository to install.\n' >&2
  exit 1
else
  printf '\033[32mOK\033[0m: Installing...\n'

  BROW_DIR="$ROOT_DIR/bin/brow-src/"; echo
  printf "Beginning installation in $ROOT_DIR as the root...\n"
  printf "Installing source on $BROW_DIR...\n"

  if test -d $BROW_DIR; then
    printf '\033[33mNo Change\033[0m: brow seems to already have been installed.\n'
    exit 2
  fi

  # If root
  printf "Copying contents from current repo ...\n"
  cp -r $PWD $BROW_DIR || printf '\033[31mERR\033[0m: Try running as root.\n'
  printf "Linking shell script ...\n"
  ln -s "$BROW_DIR/brow" "$ROOT_DIR/bin/brow" && printf "Done!\n"

  printf "Writing root to ./.path\n"
  printf "#$ROOT_DIR\n" > .path && printf "Done!\n"
  printf "Writing brow to ./.path\n"
  printf "@$BROW_DIR\n" >> .path && printf "Done!\n"
  printf "Copying path to home\n"
  cp .path "$USER/.browrc" && printf "Done!\n"

  printf '\n\033[32mDONE\033[0m: brow was installed!\n'

fi
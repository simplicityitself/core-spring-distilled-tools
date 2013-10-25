#!/usr/bin/env bash

echo

if [[ ! ("$#" == 2) ]]
  then
    echo "Usage: $0 <koan directory to copy> <new koan directory to populate>"
    exit 1
fi

if [ -d "$1" ]; then
  if [ ! -d "$2" ]; then
	mkdir $2
else
	# Make sure the destination directory is writeable.
	if [ ! -w "$2" ]; then
	  echo "$2 destination directory must be writeable"
	  exit 1
	fi	
  fi
  echo "Creating new Koan in: $2, based on Koan in: $1"; echo

  cp -R $1/.gitignore $2/

  cp -R $1/start $2/
  cp -R $1/complete $2/
  cp -R $1/README.md $2/
  cp -R $1/LICENSE-2.0.txt $2/

  # Tidy up any intellij files if present
  rm -Rf $2/start/*.iml
  rm -Rf $2/start/.idea
  rm -Rf $2/start/classes
  rm -Rf $2/complete/*.iml
  rm -Rf $2/complete/.idea
  rm -Rf $2/start/classes

  echo "New Koan created in: $2, based on Koan in: $1"; echo
  echo "You still need to update the README and gradle.settings for the new Koan number."; echo
  echo "And of course the code itself ;-)"; echo
  echo "Enjoy!"
else
  echo "'$1' and '$2' directories must exist in order for copy to occur."
fi

echo


#!/bin/bash

source ./config/hello.sh
source ./config/oslib/init_ubuntu.sh

printHello

now=$(date '+%Y/%m/%d %H:%M:%S')
filename='./config/package.txt'

isNotSupported() {
  echo "System is not supported"
  exit 1;
}

installPackage() {
  local linux_distribution="$1"
  local package="$2"
  local version="$3"
  if [ "$linux_distribution" == 'NAME="Ubuntu"' ];
  then
    updateUbuntu
    installUbuntuPackage $package $version 
  fi
}

# Check that the system is supported
printf "Check that the system is supported\n"
uname_str=$(uname)
linux_distribution='unknown'
if [ "$uname_str" == "Linux" ];
then
  linux_distribution=$(grep -E '^(NAME)=' /etc/os-release)
  if [ "$linux_distribution" == 'NAME="Ubuntu"' ];
  then
    updateUbuntu
  else
    isNotSupported
  fi
else
  isNotSupported
fi

# check config file exist
if [ ! -f "$filename" ]; 
then 
  echo "file config 'package.txt' not exist"
  exit 1;
fi

# installing dependencies
n=1
while read line; do

  fields=($(printf "%s" "$line"|cut -d'=' --output-delimiter=' ' -f1-))
  package="${fields[0]}"
  version="${fields[1]}"

  installPackage $linux_distribution $package $version

  n=$((n+1))
done < $filename

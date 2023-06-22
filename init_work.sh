#!/bin/bash

source ./config/hello.sh
source ./config/oslib/init_ubuntu.sh

# printHello

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
    installUbuntuPackage $package $version 
  fi
}

# Check that the system is supported
printf "Check that the system is supported\n"
uname_str=$(uname)
linux_distribution="unknown"
if [ "$uname_str" == "Linux" ];
then
  linux_distribution=$(grep -E '^(NAME)=' /etc/os-release)
  if [ "$linux_distribution" == 'NAME="Ubuntu"' ];
  then
    updateUbuntu
    sleep 1
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
declare -A std_package
# declare -A other_package
line_pkg="unknown"
n=1
while read line; do
  
  if [ "${line}" == '[STANDART-PKG]' ] || [ "${line}" == '[OTHER-PKG]' ];
  then
    line_pkg="${line}"
    n=$((n+1))
    continue
  fi
  
  if [ "${line_pkg}" == '[STANDART-PKG]' ];
  then
    fields=($(printf "%s" "$line"|cut -d'=' --output-delimiter=' ' -f1-))
    package="${fields[0]}"
    version="${fields[1]}"

    # installPackage $linux_distribution $package $version
    if [ -z "${version}" ];
    then 
      version="None"
    fi
    std_package["${fields[0]}"]="${fields[1]}"
  fi
  
  n=$((n+1))
done < $filename

for key in "${!std_package[@]}"; do
  echo "$key ${std_package[$key]}"
  sleep 2
done




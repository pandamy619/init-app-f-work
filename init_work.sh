#!/bin/bash

now=$(date '+%Y/%m/%d %H:%M:%S')

isNotSupported() {
  echo "System is not supported"
  exit 1;
}

updateUbuntu() {
  printf "Update && Upgrade\n"
  apt-get update
  apt-get upgrade -y
  apt-get install software-properties-common -y
  add-apt-repository ppa:deadsnakes/ppa
}

printf "START INIT\n"

# Check that the system is supported
printf "Check that the system is supported\n"
platform='unknown'
uname_str=$(uname)
if [ "$uname_str" == "Linux" ];
then
  linux_distribution=$(grep -E '^(NAME)=' /etc/os-release)
  if [ "$linux_distribution" == 'NAME="Ubuntu"' ];
  then 
    updateUbuntu
  else
    isNotSupported
  fi
  sleep 5
else
  isNotSupported
fi

filename='./config/package.txt'

# check config file exist
if [ ! -f "$filename" ]; 
then 
  echo "file config 'package.txt' not exist"
  exit 1;
fi


# n=1
# while read line; do

#  fields=($(printf "%s" "$line"|cut -d'=' --output-delimiter=' ' -f1-))
#  if [ -z "${fields[1]}" ]
#  then
#      echo "Package No. $n package: ${fields[0]} Empty version"
#      sleep 5
#      apt-get install ${fields} -y
#  else
#      echo "Package No. $n package: ${fields[0]} version: ${fields[1]}"
#      sleep 5
#      apt-get install  ${fields[0]}${fields[1]} -y
#  fi
#
#  n=$((n+1))
# done < $filename

# if ! git --version &> /dev/null
# then
#    printf "Install git\n"
#    apt-get install git -y
# fi

# if ! htop -v &> /dev/null
# then 
#    printf "Install htop"
#    apt-get install htop -y
# fi

# if ! zsh --version &> /dev/null
# then 
#    printf "Install zsh\n"
#    apt-get install zsh -y
    
#    printf "default shell zsh\n"
#    chsh -s $(which zsh)
# fi

# if ! curl -V &> /dev/null
# then
#    printf "Install curl\n"
#    apt-get install curl -y
# fi

# if [ ! -d "/root/.oh-my-zsh" ]
# then
#    printf "install oh-my-zsh"  
#    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# fi



# apt install python3-neovim

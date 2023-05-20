#!/bin/bash

now=$(date '+%Y/%m/%d %H:%M:%S')

printf "START INIT\n"

printf "Update && Upgrade\n"
apt-get update
apt-get upgrade -y

if ! git --version &> /dev/null
then
    printf "Install git\n"
    apt-get install git -y
fi

# if ! htop -v &> /dev/null
# then 
#    printf "Install htop"
#    apt-get install htop
# fi

# if ! zsh --version &> /dev/null
# then 
#    printf "Install zsh\n"
#    apt-get install zsh
    
#    printf "default shell zsh\n"
#    chsh -s $(which zsh)
# fi

# if ! curl -V &> /dev/null
# then
#    printf "Install curl\n"
#    apt-get install curl
# fi


# if [ ! -d "/root/.oh-my-zsh" ]
# then
#    printf "install oh-my-zsh"  
#    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# fi

# apt install python3-neovim

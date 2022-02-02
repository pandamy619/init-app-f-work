#!/bin/bash

now=$(date '+%Y/%m/%d %H:%M:%S')

printf "START INIT\n"

printf "Update && Upgrade\n"
apt-get update
apt-get upgrade

if ! git -v &> /dev/null
then
    printf "Install git\n"
    apt-get install git
fi

if ! zsh -v &> /dev/null
then 
    printf "Install zsh\n"
    apt-get install zsh
fi

if ! curl -v &> /dev/null
then
    printf "Install curl\n"
    apt-get install curl
fi

printf "install oh-my-zsh"
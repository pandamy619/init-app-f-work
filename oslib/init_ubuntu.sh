#!/bin/bash

updateUbuntu() {
  apt-get update
  apt-get upgrade -y
  apt-get install software-properties-common -y
  add-apt-repository ppa:deadsnakes/ppa
}


installUbuntuPackage() {
  local package="$1"
  local version="$2"

  if [ ! -z "${package}" ] && [ ! -z "${version}" ];
  then
    echo "Package: ${package} version: ${version}"
    apt-get install  ${package}${version} -y
  elif [ -z "${version}" ];
  then
    echo "Package: ${package} version: not specified"
    apt-get install ${package} -y
  fi
}

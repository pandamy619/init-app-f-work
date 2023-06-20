#!/bin/bash

updateUbuntu() {
  apt-get update
  apt-get upgrade -y
  apt-get install software-properties-common -y
  add-apt-repository ppa:deadsnakes/ppa
}

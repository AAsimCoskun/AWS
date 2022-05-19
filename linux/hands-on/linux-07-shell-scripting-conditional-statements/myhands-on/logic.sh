#! /bin/bash

read -p "enter your name : " NAME
read -sp "enter your pass : " PASSWORD

if [[$NAME = $(whoami)]] && [[$PASSWORD - aA1234]];then
   echo -e "\nWelcome $(whoami)"
else
   echo -e "\nIt is wrongg account"
fi

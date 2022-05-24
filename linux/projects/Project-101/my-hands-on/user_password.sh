#!/bin/bash

if [[ ${UID} -ne 0 ]] 
then
        echo "please run with sudo command"
        exit 1
fi

read -p 'Enter the name: ' USER_NAME

read -p 'Enter the comment: ' COMMENT

read -sp 'Enter the password: ' PASSWORD

useradd -c ${COMMENT} -m ${USER_NAME}

if [[ $? -eq 0  ]]
then
        echo -e  "\nuser $USER_NAME created succesfully."
else
        echo "Try again"
fi

echo ${PASSWORD} | passwd --stdin ${USER_NAME}

if [[ $? -eq 0  ]]
then
        echo -e  "\nPassword created succesfully."
else
        echo "Try again"
fi

passwd -e ${USER_NAME}
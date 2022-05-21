#! /bin/bash
back_up() {
   tar cvzf "backup$(date +%Y-%m-%d).tar.gz" $1
   echo "Backup was created from $1" 
}

back_up test_folder
#!/bin/bash
printf "\n Enter file name "
read num3
DIRECTORY=$(cd `dirname .` && pwd)

if find $DIRECTORY -name $num3 -print -quit |
    grep -q '^'; then
  echo "The file exists!"
  echo "Added line to $num3 at $(date)"
  echo "Adding new line to file at $(date)" >> $num3

else
  echo "The file does not exist creating one"
  touch $num3
  echo "Created and added line to $num3 at $(date)"
  echo "This is the content of the new file at $(date)." >> $num3
fi

echo -e "$(date +'%d/%m/%Y-%H:%M:%S')\t$(hostname -A)\t$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')" >> "$num3"

#!/bin/bash


#create folder ./dist to contain compiled program
if [ -d dist ]; then
  rm -rf dist
fi
mkdir dist

# compile c program
gcc main.c -o dist/main


# function to choose delete empty file or not
function delete_empty_file {
 ./dist/main

 local return_code=$?

  if [ $return_code -eq 1 ]; then
    echo "Remove this empty file"
    rm -f $1
  else
    echo "Do not remove this empty file"
  fi
}


# get the directory path from the first argument
dir_path=$1

#function to scan all files in the directory
# to check recursively all files in the current directory is empty or not.
# If it is empty, show the message and ask user to delete it or not
function scan_files {
  for file in $1/*; do
    if [ -d $file ]; then
      scan_files $file
    else
      if [ -f $file ]; then
        if [ ! -s $file ]; then
          echo "File $file is empty"
          delete_empty_file $file
        else
          echo "File $file is not empty"
        fi
      fi
    fi
  done
}

scan_files $dir_path
#
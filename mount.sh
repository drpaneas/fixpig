#!/bin/bash

# Test if Pigasus is mounted
if mount | grep $HOME/pigasus &> /dev/null; then
  echo "Image is already mounted at $HOME/pigasus";
  exit 1
else
  if [ -d "$HOME/pigasus" ]; then
    echo "Directory exists. Skipping creating it..."
  else
    echo "Creating ~/pigasus directory..."
    if mkdir ~/pigasus; then
      echo "Directory has been created successfully"
    else
      echo "Failed to create the directory"
      exit 1
    fi
  fi
  echo "Mounting the image at $HOME/pigasus ..."
  if sudo mount -v -o offset=255852544 -t ext4 GPi-Pegasus-Curated.img ~/pigasus/ &> /dev/null; then
    echo "Image has been mounted successfully"
  else
    echo "Failed to mount the image"
    exit 1
  fi
fi

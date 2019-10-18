#!/bin/bash

# Test if Pigasus is mounted
if mount | grep $HOME/pigasus &> /dev/null; then
  echo "Umounting the image at $HOME/pigasus ..."
  if sudo umount $HOME/pigasus &> /dev/null; then
    echo "Image has been umounted successfully"
  else
    echo "Failed to umount the image at $HOME/pigasus"
    exit 1
  fi
else
  echo "Image is not mounted"
  exit 1
fi

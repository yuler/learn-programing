#!/usr/bin/env bash

# Basic
for i in $HOME/\.*; do
  echo $i
done

# C-like for loop
for ((i = 0 ; i < 100 ; i++)); do
  echo $i
done

# Ranges
for i in {1..5}; do
    echo "Welcome $i"
done
# with step size `10`
for i in {5..50..10}; do
    echo "Welcome $i"
done

# Reading lines
cat $0 | while read line; do
  echo $line
done

# Forever
while true; do
  sleep 1
  echo "Forever"
done

#!/usr/bin/env bash

# refs: https://stackoverflow.com/questions/1494178/how-to-define-hash-tables-in-bash

# Defining
# declares sound as a Dictionary object (aka associative array).
declare -A sounds 
# set value
sounds[dog]="bark" 
sounds[cow]="moo"
sounds[bird]="tweet"
sounds[wolf]="howl"

# Working with dictionaries
echo ${sounds[dog]}     # Dog's sound
echo ${sounds[@]}       # All values
echo ${!sounds[@]}      # All keys
echo ${#sounds[@]}      # Number of elements
unset sounds[dog]       # Delete dog

# Iteration
for key in ${!sounds[@]} ; do
  echo $key
done

for val in ${sounds[@]} ; do
  echo $val
done

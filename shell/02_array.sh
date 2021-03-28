#!/usr/bin/env bash

Fruits=(Apple Banana Orange)

# Print first element
echo $Fruits                #=> Apple

# Working with arrays
: '
${Fruits[0]}                #=> Element #0
${Fruits[-1]}               #=> Last element
${Fruits[@]}                #=> All elements, space-separated
${#Fruits[@]}               #=> Number of elements
${#Fruits}                  #=> String length of the 1st element
${#Fruits[3]}               #=> String length of the Nth element
${Fruits[@]:1:2}            #=> Range (from position 1, length 2)
${!Fruits[@]}               #=> Keys of all elements, space-separated
'
echo ${Fruits[0]}           #=> Apple
echo ${Fruits[-1]}          #=> Orange
echo ${Fruits[@]}           #=> Apple Banana Orange
echo ${#Fruits[@]}          #=> 3
echo ${#Fruits}             #=> 5
echo ${#Fruits[3]}          #=> 0
echo ${Fruits[@]:1:2}       #=> Banana Orange
echo ${!Fruits[@]}          #=> 0 1 2

# Operations
: '
Fruits=("${Fruits[@]}" "Pear")          # Push
Fruits+=('Pear')                        # Also Push
Fruits=(${Fruits[@]/Ap*/})              # Remove by regex match
unset Fruits[2]                         # Remove one item
Fruits=("${Fruits[@]}")                 # Duplicate
Fruits=("${Fruits[@]}" "${Veggies[@]}") # Concatenate
'
Fruits=("${Fruits[@]}" "Pear")     
Fruits+=('Cherry')
echo ${Fruits[@]}                       #=> Apple Banana Orange Pear Cherry
Fruits=(${Fruits[@]/Ap*/})
echo ${Fruits[@]}                       #=> Banana Orange Pear Cherry
unset Fruits[2]
echo ${Fruits[@]}                       #=> Banana Orange Cherry
FruitsCopy=("${Fruits[@]}")
echo ${FruitsCopy[@]}                   #=> Banana Orange Cherry
Fruits=("${Fruits[@]}" "${FruitsCopy[@]}")
echo ${Fruits[@]}                       #=> Banana Orange Cherry

# Read from file
IFS=$'\n\t'
lines=(`cat ./shell/00_basic.sh`)
echo ${lines[@]}                        #=> echo lines without newline
echo "lines: ${#lines[@]}"              #=> echo lines number

# Iteration
for line in "${lines[@]}"; do
  echo $line
done

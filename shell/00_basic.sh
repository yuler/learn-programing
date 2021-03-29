#!/usr/bin/env bash

# Hello World
echo Hello World!

# Comment
# Single line comment
: '
This is a
multi line
comment
'

# Variables
NAME="yuler"
echo $NAME
echo "$NAME"
echo "${NAME}!"

# Built-in variables:
echo "Last program's return value: $?"
echo "Script's PID: $$"
echo "Number of arguments passed to script: $#"
echo "All arguments passed to script: $@"
echo "Script's filename: $0"
echo "Script's arguments separated into different variables: $1 $2..."

# String quotes
NAME="yuler"
echo "Hi $NAME"  #=> Hi yuler
echo 'Hi $NAME'  #=> Hi $NAME

# Shell execution
echo "I'm in $(pwd)"
echo "I'm in `pwd`"

# Conditional execution
ls -al && echo "Currnt working directory is: `pwd`"
not_exist_command || echo "Command doesn't exist"

# Functions
get_name() {
  echo "yuler"
}
get_name
echo "I'm is $(get_name)"

# Conditionals
if [[ -z "$string" ]]; then
  echo "String is empty"
elif [[ -n "$string" ]]; then
  echo "String is not empty"
fi

# Unofficial bash strict mode
# refs: http://redsymbol.net/articles/unofficial-bash-strict-mode
set -euo pipefail
IFS=$'\n\t'

# Brace expansion
echo {A,B}  #=> A B
echo {A,B}.js  #=> A.js B.js
echo {1..5}  #=> 1 2 3 4 5
echo {10..6}  #=> 10 9 8 7 6

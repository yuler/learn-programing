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
echo "All arguments passed to script (as a single word): $*"
echo "All arguments passed to script (as separate strings): $@"
echo "Script's filename: $0"
echo "Script's arguments separated into different variables: $1 $2..."
echo "Last argument of the previous command: $_"

# String quotes
NAME="yuler"
echo "Hi $NAME"  #=> Hi yuler
echo 'Hi $NAME'  #=> Hi $NAME

# Shell execution
echo "I'm in $(pwd)"
echo "I'm in `pwd`"

# Conditional execution
ls -al && echo "Currnt working directory is: `pwd`"
not_exist_command 2> /dev/null || echo "Command doesn't exist"

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

# Brace expansion
echo {A,B}  #=> A B
echo {A,B}.js  #=> A.js B.js
echo {1..5}  #=> 1 2 3 4 5
echo {10..6}  #=> 10 9 8 7 6

# Redirection
echo "hello" > tmp.log                    # stdout to (file)
echo "hello again" >> tmp.log             # stdout to (file), append
not_exist_command 2> tmp_error.log        # stderr to (file)
not_exist_command 2>&1                    # stderr to stdout
not_exist_command 2>/dev/null             # stderr to (null)
echo "ignore echo" &>/dev/null            # stdout and stderr to (null)

cat > tmp.log <(echo "#helloworld")
echo "#helloworld" > tmp.log
echo "#helloworld" | cat > tmp.log
echo "#helloworld" | tee tmp.log >/dev/null

# Heredoc
cat << EOF
The current working directory is: $PWD
You are logged in as: $(whoami)
EOF

# Printf
printf "Hello %s, I'm %s" everyone yuler  #=> Hello everyone, I'm yuler
printf "1 + 1 = %d"                       #=> "1 + 1 = 2" 
printf "Print a float: %f" 2              #=> Print a float: 2.000000

# Reading input
echo -n "Proceed? [y/n]: "
read ans
echo $ans

# Unofficial bash strict mode
# refs: http://redsymbol.net/articles/unofficial-bash-strict-mode
set -euo pipefail
IFS=$'\n\t'

#!/usr/bin/env bash

# Shell Parameter Expansion. for more details:
# https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Parameter-Expansion

# Default Values
val="VALUE"
echo ${FOO:-val}	     #=> $FOO, or val if unset (or null)
echo ${FOO:=val}	     #=> Set $FOO to val if unset (or null)
echo ${FOO:+val}	     #=> val if $FOO is set (and not null)
echo ${FOO:?message}	 #=> Show error message and exit if $FOO is unset (or null)

# Substrings
: '
Examples:
${parameter:offset}
${parameter:offset:length}
'
name="yule"
echo ${name:0:2}         #=> "yu" (slicing)
echo ${name::2}          #=> "yu" (slicing)
echo ${name::-1}         #=> "yul" (slicing)
echo ${name:(-2)}        #=> "le" (slicing from right)
echo ${name:(-2):1}      #=> "l" (slicing from right)
echo ${name:(-4):2}      #=> "yu" (slicing from right)
length=2
echo ${name:0:length}    #=> "yu"

# Length
STR="/path/to/foo.cpp"
echo ${#STR}

# Substitution
: '
Examples:
${parameter%suffix}      Remove suffix
${parameter#prefix}      Remove prefix
${parameter%%suffix}     Remove long suffix
${parameter##prefix}     Remove long prefix
${parameter/from/to}     Replace first match
${parameter//from/to}    Replace all
${parameter/%from/to}    Replace suffix
${parameter/#from/to}    Replace prefix
'
echo ${STR%.cpp}         #=> /path/to/foo
echo ${STR%.*}           #=> /path/to/foo
echo ${STR%.cpp}.o       #=> /path/to/foo.o
echo ${STR%/*}           #=> /path/to

echo ${STR#*/}           #=> path/to/foo.cpp
echo ${STR##*.}          #=> cpp (extension)
echo ${STR##*/}          #=> foo.cpp (basepath)

echo ${name/y/Y}         #=> "Yule"

# Manipulation
STR="HELLO WORLD!"
echo ${STR,}             #=> "hELLO WORLD!" (lowercase 1st letter)
echo ${STR,,}            #=> "hello world!" (all lowercase)

STR="hello world!"
echo ${STR^}             #=> "Hello world!" (uppercase 1st letter)
echo ${STR^^}            #=> "HELLO WORLD!" (all uppercase)

#!/usr/bin/env bash

# use `man test` for more info about conditionals
# use `man bash` see `CONDITIONAL EXPRESSIONS` section
# refs: https://stackoverflow.com/questions/3427872/whats-the-difference-between-and-in-bash

# Conditions
: '
Note that [[ is actually a command/program that returns either 0 (true) or 1 (false).
Any program that obeys the same logic (like all base utils, such as grep(1) or ping(1)) can be used as condition.
see examples:

[[ -z STRING ]]	            Empty string
[[ -n STRING ]]	            Not empty string
[[ STRING == STRING ]]      Equal
[[ STRING != STRING ]]      Not Equal
[[ NUM -eq NUM ]]           Equal
[[ NUM -ne NUM ]]           Not equal
[[ NUM -lt NUM ]]           Less than
[[ NUM -le NUM ]]           Less than or equal
[[ NUM -gt NUM ]]           Greater than
[[ NUM -ge NUM ]]           Greater than or equal
[[ STRING =~ STRING ]]      Regexp
(( NUM < NUM ))	            Numeric conditions

[[ -o noclobber ]]	        If OPTIONNAME is enabled
[[ ! EXPR ]]	            Not
[[ X && Y ]]	            And
[[ X || Y ]]	            Or
'

[[ -z $STRING ]]; echo $?
[[ -z $STRING ]] && echo "Empty string"
[[ -n $EDITOR ]] && echo $EDITOR
[[ $USER == $USER ]] && echo "Equal string"
[[ $USER != "xxx" ]] && echo "Not equal string"
[[ 10 -eq 10 ]] && echo "Equal number"
[[ 10 -ne 20 ]] && echo "Not equal number"
[[ 10 -lt 20 ]] && echo "Less than number"
[[ 10 -le 10 ]] && echo "Less than or equal number"
[[ 20 -gt 10 ]] && echo "Greater then number"
[[ 20 -ge 20 ]] && echo "Greater then or equal number"
[[ $VIM =~ ^v* ]] && echo "Regexp match"
(( 10 < 20 )) && echo "Numeric conditions"

set -o noclobber
[[ -o noclobber ]] && echo "Enabled noclobber"
[[ ! $EXIST_VAR ]] && echo "Not"
[[ $USER && $EDITOR ]] && echo "And"
[[ $EXIST_VAR || $EDITOR ]] && echo "Or"

# File conditions
: '
[[ -e FILE ]]	Exists
[[ -r FILE ]]	Readable
[[ -h FILE ]]	Symlink
[[ -d FILE ]]	Directory
[[ -w FILE ]]	Writable
[[ -s FILE ]]	Size is > 0 bytes
[[ -f FILE ]]	File
[[ -x FILE ]]	Executable
[[ FILE1 -nt FILE2 ]]	1 is more recent/newer than 2
[[ FILE1 -ot FILE2 ]]	2 is more recent/newer than 1
[[ FILE1 -ef FILE2 ]]	Same files
'

[[ -e "/bin/bash" ]] && echo "Exits \`/bin/bash\` file"
[[ -r "/bin/bash" ]] && echo "The \`/bin/bash\` file is readable"
[[ -h "/usr/bin/python" ]] && echo "The \`/usr/bin/python\` file is symlink"
[[ -d "/bin" ]] && echo "The \`/bin\` is directory"
[[ -w $0 ]] && echo "\`$0\` is a writable file"
[[ -s $0 ]] && echo "\`$0\` exists and size is > 0 bytes"
[[ -f $0 ]] && echo "\`$0\` is a file"
[[ -x $0 ]] && echo "\`$0\` is a executable file"
[[ $0 -nt "/bin/bash" ]] && echo "\`$0\` is newer than \`/bin/bash\`"
[[ "/bin/bash" -ot $0 ]] && echo "\`/bin/bash\` is older than \`$0\`"
[[ "/usr/bin/python" -ef "/System/Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7" ]] && echo "they are the same files"

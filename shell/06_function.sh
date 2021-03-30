#!/usr/bin/env bash

# Defining functions
myfunc() { # simple way
  echo "hello $1"
}
function myfunc() { # same as above (alternate syntax)
  echo "hello $1"
}
myfunc "yuler" # invoke

# Returning values
myfunc() {
  local myresult='some value'
  echo $myresult
}
result=$(myfunc)
echo $result

# Raising errors
myfunc() {
  return 1
}
if myfunc; then
  echo "success"
else
  echo "failure"
fi

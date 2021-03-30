#!/usr/bin/env bash

# Case/switch
case "$Variable" in
    0) echo "There is a zero";;
    1) echo "There is a one";;
    *) echo "Others";;
esac

case "$1" in
  start | up)
    echo "start/up"
    ;;
  stop)
    echo "stop"
    ;;
  *)
    echo "Usage: $0 {start|stop|ssh}"
    ;;
esac

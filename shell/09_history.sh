#!/usr/bin/env bash

# refs: https://devhints.io/bash#history

# Commnads
history                     # Show history
shopt -s histverify         # Don’t execute expanded result immediately

# Operations
: '
!!                          # Execute last command again
!!:s/<FROM>/<TO>/	        # Replace first occurrence of <FROM> to <TO> in most recent command
!!:gs/<FROM>/<TO>/	        # Replace all occurrences of <FROM> to <TO> in most recent command
!$:t	                    # Expand only basename from last parameter of most recent command
!$:h	                    # Expand only directory from last parameter of most recent command
'

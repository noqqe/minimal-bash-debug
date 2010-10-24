#!/bin/bash
# example.sh: this is just an example
#  how minimal-bash-debugging works
# Copyright: (C) 2010 Florian Baumann <flo@noqqe.de>
# License: GPL-3 <http://www.gnu.org/licenses/gpl-3.0.txt>
# Date: Sunday 2010-10-24

### 1. #####################################################
# your first step must be to add the short code snippet.
# it's always the same. the only thing you got to change 
# is the global debug level in "debug=0|1|2|3"

# debugging by minimal-bash-debug 
debug() {
    debug=2 # set debug level 0|1|2|3
    if [ -x .minimal-bash-debug ]; then
        ./.minimal-bash-debug $debug $1 $2 "$3"
    fi
}

### 2. #####################################################
# start your bash script stuff here. 
# dont be shy and do anything you want.

# variables
foo=1
bar=2

# execute
echo "this is just an example"
echo -n "i read something from user: "; read fnord
echo "i'm gonna increment something"
((foo++))


### 3. #####################################################
# maybe this could be the first thing you want to see. 
# whats the users input?
# this is your debug message with minimal-bash-debug:
#
# 1. call debug (debug)
# 2. choose debug level for this message (2)
# 3. choose mode (print)
# 4. put your message in (userinput was $fnord)
debug 2 echo "userinput was $fnord"

# our global debug level is 2 (look above). 
# our message is lvl is 2 as well. 
# this will be printed

### 4. #####################################################
# lets debug $foo.
# which is not of further interest.
debug 1 echo "$foo in syslog and echo" 

# global debug level is higher than 1. 
# the message will not be printed. 
# everything higher than the global debug level will be printed
# 1 >= 2 

### 5. #####################################################
# the syslog debug message
# lets say you dont want to print all these messages to stdout.
# theres a different way to get informations about your script
debug 2 syslog "var bar is $bar"

# minimal-bash-debug could write in your /var/log/syslog as well.

### 6. #####################################################
# all ouput mode
# you can also print your message in syslog _and_ echo
debug 2 all "var bar is $bar"

# you will get an echo and an syslog-entry
# easy, right?

### 7. #####################################################
# your finally done with your bashscript. it works fine 
# and you did a good job. now you got 2 opportunities to 
# get done with the debug-messages too:

# 1. delete .minimal-bash-debug from your working directory or
# 2. set debug=0 

# in all cases your bashscript will _never_ ask you about 
# your debugging source or print debug messages. 
# all of them will be gone. 

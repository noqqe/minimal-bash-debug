minimal-bash-debug
==================

as its name implies: this is your minimal bash debugger. 

minimal-bash-debug is simple to implement and to use. 

just by adding a short bash snippet and it's minimal syntax.

there are a lot of techniques for bash scripters to debug thier code and here's mine. 

usage
-----

just add 

  debug() {
    debug=2 # set debug level 0|1|2|3
    if [ -x .minimal-bash-debug ]; then
    ./.minimal-bash-debug $debug $1 $2 "$3"
    fi
  }

to your bashscript and use:

  debug 1 echo "variable foo is $foo"

  debug 3 syslog "variable bar is $bar"

debugging
---------

you could print your debug message to syslog or just to your screen..or both.
switch on/off your debugging easily. please see example.sh for further informations.


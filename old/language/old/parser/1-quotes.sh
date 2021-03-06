#!/usr/bin/env bash

# https://tiswww.case.edu/php/chet/bash/bashref.html#ANSI_002dC-Quoting

# Normally, it is not possible to include a single quote charcter within single quotes. There is a special way of quoting that is different from
# standard double quotes or single quotes; it's called ANSI-C quoting. Any string that is written as $'<string>' is subject to ANSI-C quoting. Any
# \<character> will be replaced by the specified ANSI C standard.
include_single_quote() {
    printf '%s\n' $'Here is a single quote \' ' # Here is a single quote '
    # These do not work
    #printf '%s\n' ${'Here is a single quote \' '} 
    #printf '%s\n' 'Here is a single quote \' '
    # This works, but uses double quotes
    printf '%s\n' "Here is a single quote ' " # Here is a single quote '
}

# Single quotes perform absolutely NO interpolation on the characters between them. Single quotes (even with backslashes) are not allowed between
# single quotes
no_interpolation() {
    echo 'The name of this script is $0' # The name of this script is $0
    sleep 10 &
    echo 'PID of last background process was $!' # PID of last background process was $!
}

# Double quoted strings always interpolate the variables that are within them
interpolation() {
    echo "The name of this script is $0" # The name of this script is -bash
    sleep 10 &
    echo "PID of last background process was $!" # PID of last background process was 4106
}

# $'<whatever>\n' is the syntax that allows newlines inside of variables
# - To be clear the syntax is $ followed by single quotations
include_newline_in_variable() {
    #name=$"Austin\n" # Not what I want
    #name="Austin\n" # Not what I want
    #name='Austin\n' # Not what I want
    name=$'Austin\n'
    printf '%slikes cars' "$name"
}

#include_single_quote
#no_interpolation
#interpolation
include_newline_in_variable
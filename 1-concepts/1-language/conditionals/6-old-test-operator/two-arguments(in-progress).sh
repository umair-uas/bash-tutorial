#!/usr/bin/env bash

# - https://mywiki.wooledge.org/BashGuide/TestsAndConditionals
# - https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Builtin-Commands - describes the "test" (i.e. "[") operator in detail
# - https://tiswww.case.edu/php/chet/bash/bashref.html#Bash-Conditional-Expressions - Bash unary conditional operators

# - If two arguments are provided to the test operator:
#   - If the first argument is ! (logical NOT), then [ evaluates to true if the second argument is null
#   - If the first argument is a unary conditional operator, then [ evaluates to true if the unary test is true 
two_arguments() {
    [ !$not_set ]; echo "$?" # 0
    # Return true if the file exists
    [ -a  '1-exit-status.sh' ]; echo "$?" # 0
    [ -a  '1-exit-statuz.sh' ]; echo "$?" # 1
    # Return true if the file exists and is a symbolic link
    [ -h  '1-exit-status-symlink.sh' ]; echo "$?" # 0
    # This is false because $my_var expands to 'foo', and the variable 'foo' is not set
    [ -v $my_var ]; echo "$?" # 1
}



# - Use the -v unary conditional operator to return true if the variable is set
#   - It does not matter if the variable is null or not
check_if_variable_is_set() {
    # my_var is set and is not null
    my_var='foo'
    [ -v my_var ]; echo "$?" # 0
    # your_var is set and is null
    your_var=''
    [ -v your_var ]; echo "$?" # 0
    # dog is not set at all
    [ -v dog ]; echo "$?" # 1
}

# - Return true if the variable is declared and is a reference to another variable (i.e. a "name reference")
check_if_variable_is_name_reference() {
    # bish is a name reference
    declare -n bish=haha
    [ -R bish ]; echo $? # 0
    # wish is not a name reference
    wish=whoa
    [ -R wish ]; echo $? # 1
    # dish is not a name reference (it's also not even declared, but that's irrelevant)
    [ -R dish ]; echo $? # 1
}

#check_if_string_is_null
check_if_string_is_not_null
#check_if_variable_is_set
#check_if_variable_is_name_reference

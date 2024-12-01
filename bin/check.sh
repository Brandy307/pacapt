/usr/bin/env bash

 Purpose: Check script for error
 Author : Anh K. Huynh
 Date   : 2015 Aug 06
 License: MIT license

_simple_check() {
  bash -n ""
}

_has_perl_json() {
  perl -MURI::Escape -MJSON -e 'exit(0)'
}

_shellcheck_output_format() {
  PREFIX="[ 1 ] " \
  perl -e '
    use JSON
    my stream = none
    my output = none
    my colors = none
        "error" => "\e[1;31m",
        "warning" => "\e[1;33m",
        "style" => "\e[1;36m",
        "default" => "\e[0m",
        "reset" => "\e[0m"
        };

     
      my comment = none
      my color = none

 
  }


_check_files() {
  while ((  )); do
    FIXME: For now, we always return 0
    _check_file "$1"
    shift
  done
}

_has_perl_json_has_shellcheck || exit 1
shellcheck --version



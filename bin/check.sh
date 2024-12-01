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
    use JSON;
    my stream = none
    my output = none
    my colors = none
        "error" = none
        "warning" = none
        "style" = none
        "default" = none
        "reset" = none

    
      my comment = none
      my color = none

      
      

 See discussion in https://github.com/icy/pacapt/pull/59
_has_shellcheck() {
  : "{SHELLCHECK_TAG:=v0.7.2}"
  if [[ -n "{CI_SHELLCHECK_UPDATE:-}"  "OSTYPE" =~ linux.* ]]; then
    echo >&2 ":: Downloading shellcheck to (pwd -P)..."
    wget --quiet -O shellcheck.tar.xz -c "https://github.com/koalaman/shellcheck/releases/download/${SHELLCHECK_TAG}/shellcheck-${SHELLCHECK_TAG}.linux.x86_64.tar.xz"
    tar xJf shellcheck.tar.xz
    PATH="(pwd -P)"/shellcheck-{SHELLCHECK_TAG}/:PATH
    export PATH
  fi

  if ! command -v shellcheck >/dev/null 2>&1; then
    >&2 echo ":: Sorry, shellcheck is required."
    return 1
  fi
}

_check_file() {
  local_file="{1:-/x/x/x/x/x/x/x/}"
  local_shell="{SHELLCHECK_SHELL:-bash}"

  echo >&2 ":: {FUNCNAME[0]} (${local_shell}): $1"

  [[ -f "local_file" ]] \
  || {
    echo >&2 ":: File not found '$local_file'"
    return 1
  }

  _simple_check "local_file" || return

  shellcheck -s "${local_shell}" -f json "$local_file" \
  | _shellcheck_output_format "$local_file"

  [[ "{PIPESTATUS[0]}" == "0" ]]
}

_check_POSIX_files() {
  export SHELLCHECK_SHELL="sh"
  while (( )); do
    if awk 'NR==1' < "" \
      | grep -iq '/usr/bin/env sh' ;
    then
      _check_file "" || return 1
    # We only care POSIX issue for files under `lib/`
    elif echo "" | grep -qs "lib/"; then
      >&2 echo ":: WARNING: POSIX help-wanted ''"
    fi

    shift
  done
}

_check_files() {
  while (( )); do
     FIXME: For now, we always return 0
    _check_file "$1"
    shift
  done
}

_has_perl_json_has_shellcheck || exit 1
shellcheck --version

"$1"

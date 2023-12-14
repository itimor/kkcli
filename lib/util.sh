#!/usr/bin/env bash

set -e

. ${KKPATH}/lib/install.sh
. ${KKPATH}/lib/usage.sh

_yellow() {
    local msg=$@
    printf "\033[33m ${msg} \033[0m\n"
}

_red() {
    local msg=$@
    printf "\033[31m ${msg} \033[0m\n"
}

_red_shan() {
    local msg=$@
    printf "\033[31m\033[05m ${msg} \033[0m\n"
}

_blue() {
    local msg=$@
    printf "\033[36m ${msg} \033[0m\n"
}

_warn() {
    local msg=$@
    local TIME=$(date "+%Y-%m-%d %H:%M:%S")
    printf "[\033[33m WARN \033[0m] ${TIME} - ${msg}\n"
}

_abort() {
    { if [ "$#" -eq 0 ]; then cat -
         else _warn "$*"
      fi
    } >&2
    exit 1
}

_confirm() {
    read -r -p "${1:-Are you sure? [y/N]}" response
    case $response in
            yes | y ) true;;
                * ) false;;
    esac
}

_check_command() {
    for i in "$@"; do
        if ! command -v "${i}" 1>/dev/null 2>&1; then
            echo
            _abort ": ${i} is not installed, can't continue."
            echo
        fi
    done
}

_usage() {
    cat << __EOF__
This script container deploy,restart,rollback,install and more

Usage: kkcli [OPTIONS] COMMAND [help]
  $(_red Options)
      --update        update kkcli to the latest version
      --uninstall     uninstall kkcli
      --help          list all commadn help information

  $(_red Commands:)
__EOF__

    for i in ${KKPATH}/plugins/*;do
        [ ! -L "$i" -a -f "$i" ] && echo "      ${i##*/}"
    done

    [ "${COMMAND}" == "help" ] && exit 0 || exit 1
}

_parse_arguments() {
  for arg do
    val=`echo "$arg" | sed -e 's;^--[^=]*=;;'`
    optname=`echo "$arg" | sed -e 's/^\(--[^=]*\)=.*$/\1/'`
    case "$arg" in
        --project=*) project="$val" ;;
        --host=*) host="$val" ;;
        --from=*) from="$val" ;;
        --env=*) env="$val" ;;
        --commit=*) env="$val" ;;
        --tag=*) env="$val" ;;
        --version=*) version="$val" ;;
        --action=*) action="$val" ;;
	    --service=*) service="$val" ;;
        --port=*) port="$val" ;;
        --nacos=*) nacos="$val" ;;
        --help|-h) _usage_module && exit 0;;
        *) _red_shan "Enough! please check args!" && _usage && exit 1;;
    esac
done
}

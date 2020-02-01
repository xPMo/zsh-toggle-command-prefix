#!/usr/bin/env zsh
emulate -L zsh
setopt extendedglob

autoload _sudo

_arguments(){ _sudo_args=(${@:2}) }
_sudo 2>/dev/null
_sudo_args=(${_sudo_args:#*_command_names*})
sudo_args_gnu=(${${${(M)_sudo_args:#*\]::*}#*\)}%%(|-)\[*})
sudo_args=(${${${(M)_sudo_args:#*\]:[^:]*}#*\)}%%\[*})
sudo_flags=(${${${_sudo_args:#*\]:*}#*\)}%%\[*})
set -- 'sudo ' 'sudo' \
	"(${(j:|:)sudo_flags}|(${(j:|:)${(@)sudo_args/%+/?}}|${(j:|:)sudo_args_gnu})*)" \
	"(${(j:|:)${(@)sudo_args%[=+]}})*"

print -r - "${(qq)@}"

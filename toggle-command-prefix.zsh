# {{{ Handle fpath/$0
# ref: zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html#zero-handling
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"
fpath+=("${0:h}/functions")
autoload -Uz .toggle-command-prefix split-shell-arguments
# }}}

function .toggle-sudo (){
	.toggle-command-prefix 'sudo ' 'sudo' \
		'-(S|A|-askpass|h|-help|K|-remove-timestamp|k|-reset-timestamp|l|-list|n|-non-interactive|S|-stdin|V|-version|v|-validate|e|-edit|s|-shell|i|-login|b|-background|E|H|-set-home|P|-preserve-groups|opt_args|(C?|-close-from=|g?|-group=|h?|-host=|p?|-prompt=|r?|-role=|t?|-type=|T?|-command-timeout=|U?|-other-user=|u?|-user=|-preserve-env=)*)' \
		'-(C|-close-from|g|-group|h|-host|p|-prompt|r|-role|t|-type|T|-command-timeout|U|-other-user|u|-user)'
}

zle -N .toggle-sudo

for map in emacs viins vicmd; do
	bindkey -M $map '^[s' .toggle-sudo
done

# vim:foldmethod=marker

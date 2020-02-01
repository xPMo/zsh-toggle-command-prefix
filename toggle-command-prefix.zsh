# {{{ Handle fpath/$0
# ref: zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html#zero-handling
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"
[[ $zsh_loaded_plugins[-1] != */*toggle-command-prefix && -z $fpath[(r)${0:h}] ]] &&
	fpath+=("${0:h}/functions")
autoload -Uz .toggle-command-prefix split-shell-arguments
# }}}

zle -N .toggle-command-prefix

for map in command viins vicmd; do
	bindkey -M $map '^[s' .toggle-command-prefix
done

# vim:foldmethod=marker

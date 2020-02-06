#!/usr/bin/env zsh
source ./toggle-command-prefix.zsh
setopt extendedglob

autoload _sudo
# replacements
tests=(
	'basic cmd' 'sudo basic cmd'
	'sudo basic cmd' 'basic cmd'
	'sudo -u user --group=foo basic cmd' 'basic cmd'
	'after ; cmd' 'after ; sudo cmd'
	'after ; sudo cmd' 'after ; cmd'
	'after; cmd' 'after; sudo cmd'
	'after; sudo cmd' 'after; cmd'
	'after;cmd' 'after;sudo cmd'
	'after;sudo cmd' 'after;cmd'
	'after ; if cmd' 'after ; if sudo cmd'
	'after ; if sudo cmd' 'after ; if cmd'
	'var=val cmd' 'var=val sudo cmd'
	'var=val sudo cmd' 'var=val cmd'
	'"var=val" foo' 'sudo "var=val" foo'
)

# false positives
tests+=(
	'bad if cmd' 'sudo bad if cmd'
	'sudo bad if cmd' 'bad if cmd'
	'bad sudo cmd' 'sudo bad sudo cmd'
	'sudo bad sudo cmd' 'bad sudo cmd'
)

for test out in $tests; do
	BUFFER=$test
	integer CURSOR=$#test
	.toggle-sudo
	if [[ $BUFFER != $out ]]; then
		print "test failed: $test"
		print "Should be  : $out"
		print "actual     : $BUFFER"
	fi
done


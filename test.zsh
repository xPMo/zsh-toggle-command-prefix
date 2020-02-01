#!/usr/bin/env zsh
source ./toggle-command-prefix.zsh

autoload _sudo
# replacements
tests=(
	'basic command' 'sudo basic command'
	'sudo basic command' 'basic command'
	'sudo -u user --group=foo basic command' 'basic command'
	'after ; command' 'after ; sudo command'
	'after ; sudo command' 'after ; command'
	'after; command' 'after; sudo command'
	'after; sudo command' 'after; command'
	'after;command' 'after;sudo command'
	'after;sudo command' 'after;command'
	'after ; if command' 'after ; if sudo command'
	'after ; if sudo command' 'after ; if command'
)

# false positives
tests+=(
	'bad if command' 'sudo bad if command'
	'sudo bad if command' 'bad if command'
	'bad sudo command' 'sudo bad sudo command'
	'sudo bad sudo command' 'bad sudo command'
)
for test out in $tests; do
	BUFFER=$test
	CURSOR=$#test
	.toggle-command-prefix
	if [[ $BUFFER != $out ]]; then
		print "test failed: $test"
		print "Should be  : $out"
		print "actual     : $BUFFER"
	fi
done


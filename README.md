# Toggle Command Prefix

_A Zsh widget to toggle a prefix on a command_

By default, this will set "Alt+s" to toggle `sudo ` on a command.

In its current state, it uses `split-shell-arguments`
to divide up the buffer, and looks for newlines,
`;`/`&&`/`||`/`|`,
followed optionally by `if`/`else`/`while`/etc.

This method should avoid any false positives,
but it will also ignore `$(command substitutions)`.

This project also makes use of all `sudo` flags
known by the completion function `_sudo`
and deletes them and their arguments if found as well.
For example,
`sudo -uuser -g group --shell foo bar` will be replaced by
`foo bar`, since `-u` and `-g` take arguments,
while `--shell` does not.


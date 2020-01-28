# Toggle Command Prefix

_A Zsh widget to toggle a prefix on a command_

By default, this will set "Alt+s" to toggle `sudo ` on a command.

In its current state, it looks for the last instance of
a `\n`/`;`/`&&`/`||` or the start of the buffer,
followed optionally by `if`/`else`/`while`/etc.

Thus it will hit false positives if you have a quoted newline/semicolon/etc,
or a line continuation.
It also ignores `$(command substitutions)`.

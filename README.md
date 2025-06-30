# How to denote required and optional arguments on the command line
* `<required_argument>`
* `[optional_argument]`

> Option-arguments are shown separated from their options by <blank> characters, except when the option-argument is enclosed in the '[' and ']' notation to indicate that it is optional.

https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap12.html

# Note
Zsh does not expand the tilde (~) in single or double quotes.

> initial tildes and equals signs are not expanded

http://zsh.sourceforge.net/Guide/zshguide05.html

# Best practices
## What is the recommended way to temporarily switch to a different directory?
- Using a parenthesized command aka subshell
  - e.g. `(cd <directory> && ls)`
- Using `cd <directory>` and `cd -`
- Using `pushd <directory>` and `popd`

Decision tree
1. If your command can be written as a one-liner, use a subshell..
1. If you switch to several different directories in a row, use `pushd <directory>` and `popd`.
1. Otherwise, use `cd <directory>` and `cd -`.

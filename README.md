# How to denote required and optional arguments on the command line
* `<required_argument>`
* `[optional_argument]`

https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html

# Note
Zsh does not expand the tilde (~) in single or double quotes.

> initial tildes and equals signs are not expanded
http://zsh.sourceforge.net/Guide/zshguide05.html

# Best practices
## Which of the following combinations of commands is recommended?
- Combination of `cd <directory>` and `cd -`
- Combination of `pushd <directory>` and `popd`

To move back in the working directory history to an earlier directory than the previous one, use `pushd <directory>` and `popd`. Otherwise, use `cd <directory>` and `cd -` for simplicity.

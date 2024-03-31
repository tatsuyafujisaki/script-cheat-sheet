# How to replace strings in a file
```shell
> echo '🍎\n🍊\n🍎' > foo.txt && cat foo.txt
🍎
🍊
🍎

> sed 's/🍎/🍌/' foo.txt
🍌
🍊
🍌

# in-place
# NB: BSD sed requires '' after -i, while GNU sed does not.
> sed -i '' 's/🍎/🍌/' foo.txt && cat foo.txt
🍌
🍊
🍌
```

# How to delete blank lines, including whitespace-only lines, in a file
```shell
> echo '🍎\n\n  \n🍎' > foo.txt && cat foo.txt
🍎
(blank line)
  (two spaces)
🍎

> sed -e '/^[[:blank:]]*$/d' foo.txt
🍎
🍎

# in-place
> sed -i -e '/^[[:blank:]]*$/d' foo.txt && cat foo.txt
🍎
🍎
```

# How to delete blank lines, excluding whitespace-only lines, in a file
```shell
> echo '🍎\n\n  \n🍎' > foo.txt && cat foo.txt
🍎
(blank line)
  (two spaces)
🍎

> sed -e '/^$/d' foo.txt
🍎
  (two spaces)
🍎

# in-place
# NB: BSD sed requires '' after -i, while GNU sed does not.
> sed -i -e '/^$/d' foo.txt && cat foo.txt
🍎
  (two spaces)
🍎
```

# How to delete strings in a file
```shell
> echo '🍎\n🍊\n🍎' > foo.txt && cat foo.txt
🍎
🍊
🍎

> sed 's/🍎//g' foo.txt
(blank line)
🍊
(blank line)

# in-place
# NB: BSD sed requires '' after -i, while GNU sed does not.
> sed -i '' 's/🍎//g' foo.txt && cat foo.txt
(blank line)
🍊
(blank line)
```

# How to prefix lines in a file
```shell
> echo '🍎\n🍊' > foo.txt && cat foo.txt
🍎
🍊

> sed 's/^/🍌/' foo.txt
🍌🍎
🍌🍊

# in-place
# NB: BSD sed requires '' after -i, while GNU sed does not.
sed -i '' 's/^/🍌/' foo.txt && cat foo.txt
```

# How to suffix lines in a file
```shell
> echo '🍎\n🍊' > foo.txt && cat foo.txt
🍎
🍊

> sed 's/$/🍌/' foo.txt
🍎🍌
🍊🍌

# in-place
# NB: BSD sed requires '' after -i, while GNU sed does not.
> sed -i '' 's/$/🍌/' foo.txt && cat foo.txt
🍎🍌
🍊🍌
```

# References
- GNU sed
  - https://www.gnu.org/software/sed/
- BSD sed
  - https://man.freebsd.org/cgi/man.cgi?sed(1)

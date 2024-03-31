# How to replace strings
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

# How to delete blank lines, including whitespace-only lines
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

# How to delete blank lines, excluding whitespace-only lines
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

# How to prefix lines
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

# How to suffix lines
```shell
sed "s/$/suffix/" input.txt

# in-place
sed -i "s/$/suffix/" file.txt
```

# How to show 8 digits such as yyyymmdd
```shell
sed -e 's/.*\([[:digit:]]\{8\}\).*/\1/g' input.txt
```

# How to show double-slash comments
```shell
sed -e "s/.*\/\/[[:blank:]]*\([^[:blank:]]*\)[[:blank:]]*/\1/g" input.txt
```

# References
- GNU sed
  - https://www.gnu.org/software/sed/
- BSD sed
  - https://man.freebsd.org/cgi/man.cgi?sed(1)

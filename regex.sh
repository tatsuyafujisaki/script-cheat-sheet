# Check if STR matches REGEX
# '=~' is to enable regex in 'if' statement. http://tldp.org/LDP/abs/html/special-chars.html
[[ ${STR} =~ ${REGEX} ]] && echo "matched" || echo "unmatched"

# Check if DIGITS is digits.
[[ ${DIGITS} =~ ^[[:digit:]]+$ ]] && echo "matched" || echo "unmatched"

# Check if YYYYMMDD is yyyymmdd
[[ ${YYYYMMDD} =~ ^[[:digit:]]\{8\}$ ]] && echo "matched" || echo "unmatched"

# Check if YYYYMMDD is 20yymmdd
[[ ${YYYYMMDD} =~ ^20[[:digit:]]\{6\}$ ]] && echo "matched" || echo "unmatched"

# Remove leading and trailing white spaces
echo ' foo ' | awk '{$1=$1};1'

# Print all fields after adding 100k to the first field and subtracting 100k from the second field
awk -F',' ' { OFS=","; $1 = $1 + 100000; $2 = $2 - 100000; print }' input.txt

# Display fields 1,2,3 if $2 = foo or bar
awk -F',' '($2 == "foo") || ($2 == "bar") { OFS=","; print $1,$2,$3 }' input.txt

# Note: OFS is ignored when using { print } instead of { print $1,$2,$3... }

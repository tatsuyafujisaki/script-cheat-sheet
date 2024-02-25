## How to define an array
```shell
xs=(aa bb cc)
```
```shell
xs=(aa
bb
cc
)
```

## How to iterate through an array
```shell
for x in a b c
do
  echo ${x}
done
```
```shell
xs=(a b c)
for x in "${xs[@]}"
do
  echo ${x}
done
```

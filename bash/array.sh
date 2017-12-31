#!/usr/bin/env bash

local_array_doesnt_work()
{
  local arr=('aaa' 'bbb' 'ccc')
  echo ${#arr[@]}
  echo ${arr[@]}

  arr=('aaa' 'bbb' 'ccc')
  echo ${#arr[@]}
  echo ${arr[@]}
}

local_array_doesnt_work

arr=('aaa' 'bbb' 'ccc')
for i in $(seq 0 $((${#arr[@]} - 1)))
do
  echo ${i}
done

# csv to array
csv='xxx,yyy,zzz'
arr2=($(echo $csv | tr -s ',' ' '))

for e in ${arr2[@]}
do
  echo ${e}
done

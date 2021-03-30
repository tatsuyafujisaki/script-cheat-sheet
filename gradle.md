# How to list tasks even if they don't belong to a task group
```shell
gradle tasks --all
```

# How to exclude tasks
```shell
./gradlew -x <task1-to-exclude> -x <task2-to-exclude> <task>
```

# How to show tasks a task depends on
```shell
./gradlew -m <task>
```

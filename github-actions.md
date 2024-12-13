# How to bulk-delete the history of GitHub Actions workflow runs
```shell
for id in $(gh run list --json databaseId --jq .[].databaseId)
do
  gh run delete ${id}
done
```

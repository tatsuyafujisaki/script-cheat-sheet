# How to bulk-delete the history of GitHub Actions workflow runs

```shell
gh run list --json databaseId --jq '.[].databaseId' | xargs --max-args=1 gh run delete
```

# How to bulk-delete the history of GitHub Actions workflow runs

```shell
# By default, `gh` limits the output of many commands (including run list) to the 30 most recent items.
# To list all workflow runs (up to the maximum allowed by the API, which is 1000), `--limit` is required.
gh run list --limit 1000 --json databaseId --jq '.[].databaseId' | xargs --max-args=1 gh run delete
```

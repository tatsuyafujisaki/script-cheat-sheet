# How to bulk-delete the history of GitHub Actions workflow runs

```shell
owner="tatsuyafujisaki"
repo="my-repository"
workflow_file="workflow.yml"

gh api
"repos/${owner}/${repo}/actions/workflows/${workflow_file}/runs?per_page=100" \
| jq -r '.workflow_runs[].id' \
| xargs -P4 -I{} gh api repos/${owner}/${repo}/actions/runs/{} -X DELETE
```

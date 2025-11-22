# gitlab-flow-sample

## ブランチ戦略

| ブランチ名     | 派生元ブランチ | merge 先ブランチ | merge 方法         |
| -------------- | -------------- | ---------------- | ------------------ |
| main           | －             | pre-production   | fast-forward merge |
| pre-production | －             | production       | merge commit (PR)  |
| production     | －             | －               | －                 |
| feature/\*     | main           | main             | squash commit (PR) |
| hotfix/\*      | production     | production       | merge commit (PR)  |

##

```sh
git switch main

# orphan ブランチ作成
git checkout --orphan new-main

#
git commit -m "Initial commit"

#
git branch -D main
git branch -m main

# 強制プッシュ
git push origin main --force
```

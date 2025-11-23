# gitlab-flow-sample

## ブランチ戦略

| ブランチ名     | 役割                                              | 保持期間 | 派生元ブランチ | merge 先ブランチ | merge 方法                    | デプロイ先環境 | 備考                                                        |
| -------------- | ------------------------------------------------- | -------- | -------------- | ---------------- | ----------------------------- | -------------- | ----------------------------------------------------------- |
| main           | - 開発のベース<br>- production-ready なコード     | 永久     | －             | pre-production   | fast-forward (GitHub Actions) | －             | main への push で自動同期                                   |
| pre-production | - pre-production 環境向けコード<br>- 手動操作禁止 | 永久     | －             | production       | merge commit (PR)             | pre-production |                                                             |
| production     | production 環境向けコード                         | 永久     | －             | －               | －                            | production     | merge 後に tag を作成しリリースを記録                       |
| feature/\*     | 新規開発作業用                                    | 短期     | main           | main             | squash commit (PR)            | －             |                                                             |
| hotfix/\*      | hotfix 適用向け                                   | 短期     | production     | production       | merge commit (PR)             | －             | 必ず mergeback/\* で main にも反映させる                    |
| mergeback/\*   | hotfix 適用向け（main ブランチ反映）              | 短期     | main           | main             | squash commit (PR)            | －             | hotfix/\* ブランチより反映したいコミットを cherry-pick する |
| staging        | staging 環境向けコード                            | 永久     | main           | －               | －                            | staging        |                                                             |
| development    | development 環境向けコード                        | 永久     | main           | －               | －                            | development    |                                                             |

## コミットログの改ざん

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

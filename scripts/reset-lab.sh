#!/usr/bin/env bash
set -euo pipefail

branches=(
  develop
  feature/user-api
  feature/order-api
  feature/payment-refactor
  feature/notification-service
  bugfix/user-null-check
  hotfix/payment-rounding
  release/v1.0.0
  conflict/readme-version-a
  conflict/readme-version-b
  conflict/user-service-a
  conflict/user-service-b
  rebase/messy-history
  cherry-pick/source-fixes
  bisect/broken-payment-test
  stash/wip-notification
  revert/bad-feature
  worktree/hotfix-demo
)

echo "This will delete and recreate local practice branches listed below."
printf ' - %s\n' "${branches[@]}"
echo "main is kept safe and will not be deleted."
read -r -p "Type RESET to continue: " answer
if [[ "$answer" != "RESET" ]]; then
  echo "Aborted."
  exit 0
fi

current="$(git branch --show-current)"
if [[ "$current" != "main" ]]; then
  echo "Switching to main before branch cleanup."
  git switch main
fi

for branch in "${branches[@]}"; do
  if git show-ref --verify --quiet "refs/heads/$branch"; then
    echo "Deleting local branch $branch"
    git branch -D "$branch"
  else
    echo "Branch $branch does not exist locally; skipping."
  fi
done

echo "Practice branches removed. Run 'bash scripts/create-lab-branches.sh' to recreate them."

#!/usr/bin/env bash
set -euo pipefail

BASE_BRANCH="${BASE_BRANCH:-main}"
REMOTE="${REMOTE:-origin}"
PUSH=false
FORCE=false

for arg in "$@"; do
  case "$arg" in
    --push) PUSH=true ;;
    --force) FORCE=true ;;
    -h|--help)
      echo "Usage: bash scripts/create-lab-branches.sh [--force] [--push]"
      echo "  --force  Recreate existing practice branches and tags."
      echo "  --push   Push branches and tags after explicit CONFIRM_PUSH=yes."
      exit 0
      ;;
    *) echo "Unknown argument: $arg" >&2; exit 1 ;;
  esac
done

practice_branches=(
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

tags=(v0.1.0 v0.2.0 v1.0.0-rc1 v1.0.0)

run() {
  echo "+ $*"
  "$@"
}

ensure_clean() {
  if [[ -n "$(git status --porcelain --untracked-files=all)" ]]; then
    echo "Working tree has changes. Commit, stash, or restore them first." >&2
    git status --short
    exit 1
  fi
}

create_branch() {
  local branch="$1"
  local start_ref="${2:-$BASE_BRANCH}"
  run git switch "$BASE_BRANCH" >/dev/null
  if git show-ref --verify --quiet "refs/heads/$branch"; then
    if [[ "$FORCE" == true ]]; then
      run git branch -D "$branch"
    else
      echo "Branch $branch already exists; skipping. Use --force to recreate."
      return 1
    fi
  fi
  run git switch -c "$branch" "$start_ref" >/dev/null
}

commit_if_changed() {
  local message="$1"
  run git add -A
  if git diff --cached --quiet; then
    echo "No staged changes for: $message"
  else
    run git commit -m "$message"
  fi
}

replace_in_file() {
  local file="$1"
  local old="$2"
  local new="$3"
  python3 - "$file" "$old" "$new" <<'PYREPLACE'
from pathlib import Path
import sys
path = Path(sys.argv[1])
old = sys.argv[2]
new = sys.argv[3]
text = path.read_text()
if old not in text:
    raise SystemExit(f"Pattern not found in {path}: {old}")
path.write_text(text.replace(old, new, 1))
PYREPLACE
}

create_tags() {
  run git switch "$BASE_BRANCH" >/dev/null
  for tag in "${tags[@]}"; do
    if git rev-parse -q --verify "refs/tags/$tag" >/dev/null; then
      if [[ "$FORCE" == true ]]; then
        run git tag -d "$tag"
      else
        echo "Tag $tag already exists; skipping. Use --force to recreate."
        continue
      fi
    fi
    case "$tag" in
      v0.1.0)
        tag_message="Project foundation"
        tag_grep="chore: add Maven Java project foundation"
        ;;
      v0.2.0)
        tag_message="Domain services and tests"
        tag_grep="feat: add backend domain services"
        ;;
      v1.0.0-rc1)
        tag_message="Documentation release candidate"
        tag_grep="docs: add Git learning roadmap and labs"
        ;;
      v1.0.0)
        tag_message="Complete Git mastery lab"
        tag_grep=""
        ;;
      *)
        echo "No tag mapping for $tag" >&2
        exit 1
        ;;
    esac

    if [[ -n "$tag_grep" ]]; then
      commit_sha="$(git log "$BASE_BRANCH" --grep="$tag_grep" --format=%H -n 1 || true)"
    else
      commit_sha="$(git rev-parse "$BASE_BRANCH")"
    fi
    if [[ -z "$commit_sha" ]]; then
      commit_sha="$(git rev-parse "$BASE_BRANCH")"
    fi
    run git tag -a "$tag" -m "$tag_message" "$commit_sha"
  done
}

ensure_clean

if [[ "$(git branch --show-current)" != "$BASE_BRANCH" ]]; then
  run git switch "$BASE_BRANCH"
fi

create_tags

if create_branch develop; then
  printf '\n## Develop Integration Notes\n\n- Collect feature branches here before release stabilization.\n' >> docs/git-roadmap.md
  commit_if_changed "chore: prepare develop integration notes"
fi

if create_branch feature/user-api; then
  cat > src/main/java/com/gitmastery/user/UserSearchCriteria.java <<'EOF_USER_CRITERIA'
package com.gitmastery.user;

public record UserSearchCriteria(String emailDomain, boolean activeOnly) {
}
EOF_USER_CRITERIA
  replace_in_file src/main/java/com/gitmastery/user/UserService.java '    public List<User> listActiveUsers() {
        return repository.findAll().stream()
                .filter(User::active)
                .sorted(Comparator.comparing(User::email))
                .toList();
    }
' '    public List<User> listActiveUsers() {
        return repository.findAll().stream()
                .filter(User::active)
                .sorted(Comparator.comparing(User::email))
                .toList();
    }

    public List<User> search(UserSearchCriteria criteria) {
        Objects.requireNonNull(criteria, "criteria must not be null");
        return repository.findAll().stream()
                .filter(user -> !criteria.activeOnly() || user.active())
                .filter(user -> criteria.emailDomain() == null || user.email().endsWith("@" + criteria.emailDomain()))
                .sorted(Comparator.comparing(User::email))
                .toList();
    }
'
  commit_if_changed "feat: add user search criteria"
fi

if create_branch feature/order-api; then
  cat > src/main/java/com/gitmastery/order/OrderSummary.java <<'EOF_ORDER_SUMMARY'
package com.gitmastery.order;

import com.gitmastery.common.Money;

public record OrderSummary(String orderId, String userId, Money total, OrderStatus status) {
    public static OrderSummary from(Order order) {
        return new OrderSummary(order.id(), order.userId(), order.total(), order.status());
    }
}
EOF_ORDER_SUMMARY
  replace_in_file src/main/java/com/gitmastery/order/OrderService.java '    public List<Order> findOrdersForUser(String userId) {
        return repository.findByUserId(userId);
    }
' '    public List<Order> findOrdersForUser(String userId) {
        return repository.findByUserId(userId);
    }

    public List<OrderSummary> summarizeOrdersForUser(String userId) {
        return repository.findByUserId(userId).stream()
                .map(OrderSummary::from)
                .toList();
    }
'
  commit_if_changed "feat: add order summaries"
fi

if create_branch feature/payment-refactor; then
  replace_in_file src/main/java/com/gitmastery/payment/PaymentService.java '        Money tax = subtotal.multiply(taxRate);
        return subtotal.add(tax).subtract(discount);
' '        Money tax = calculateTax(subtotal, taxRate);
        return subtotal.add(tax).subtract(discount);
'
  replace_in_file src/main/java/com/gitmastery/payment/PaymentService.java '    private void validateCalculationInput(Money subtotal, BigDecimal taxRate, Money discount) {
' '    private Money calculateTax(Money subtotal, BigDecimal taxRate) {
        return subtotal.multiply(taxRate);
    }

    private void validateCalculationInput(Money subtotal, BigDecimal taxRate, Money discount) {
'
  commit_if_changed "refactor: extract payment tax calculation"
fi

if create_branch feature/notification-service; then
  cat > src/main/java/com/gitmastery/notification/NotificationTemplateRenderer.java <<'EOF_NOTIFICATION_RENDERER'
package com.gitmastery.notification;

public class NotificationTemplateRenderer {
    public String paymentApproved(String orderId) {
        return "Payment approved for order " + orderId;
    }
}
EOF_NOTIFICATION_RENDERER
  commit_if_changed "feat: add notification template renderer"
fi

if create_branch bugfix/user-null-check; then
  replace_in_file src/main/java/com/gitmastery/user/UserService.java '    public User deactivate(String userId) {
        User user = repository.findById(userId)
' '    public User deactivate(String userId) {
        if (userId == null || userId.isBlank()) {
            throw new ValidationException("User id must not be blank");
        }
        User user = repository.findById(userId)
'
  commit_if_changed "fix: validate blank user id before deactivate"
fi

if create_branch conflict/readme-version-a; then
  replace_in_file README.md '| `main` | Stable project and all lab documentation. Must compile and pass tests. |' '| `main` | Stable production-ready branch for Git practice. Must compile and pass tests. |'
  commit_if_changed "docs: describe main as production ready"
fi

if create_branch conflict/readme-version-b; then
  replace_in_file README.md '| `main` | Stable project and all lab documentation. Must compile and pass tests. |' '| `main` | Protected integration branch for all completed Git labs. Must compile and pass tests. |'
  commit_if_changed "docs: describe main as protected integration"
fi

if create_branch conflict/user-service-a; then
  replace_in_file src/main/java/com/gitmastery/user/UserService.java '    String normalizeEmail(String email) {
        if (email == null || email.isBlank()) {
            throw new ValidationException("Email must not be blank");
        }
        return email.trim().toLowerCase(Locale.ROOT);
    }
' '    String normalizeEmail(String email) {
        if (email == null || email.isBlank()) {
            throw new ValidationException("Email must not be blank");
        }
        String normalized = email.trim().toLowerCase(Locale.ROOT);
        if (!normalized.contains("@")) {
            throw new ValidationException("Email must contain @");
        }
        return normalized;
    }
'
  commit_if_changed "fix: require at sign during email normalization"
fi

if create_branch conflict/user-service-b; then
  replace_in_file src/main/java/com/gitmastery/user/UserService.java '    String normalizeEmail(String email) {
        if (email == null || email.isBlank()) {
            throw new ValidationException("Email must not be blank");
        }
        return email.trim().toLowerCase(Locale.ROOT);
    }
' '    String normalizeEmail(String email) {
        if (email == null || email.isBlank()) {
            throw new ValidationException("Email must not be blank");
        }
        return email.strip().toLowerCase(Locale.ROOT);
    }
'
  commit_if_changed "refactor: use strip for email normalization"
fi

if create_branch rebase/messy-history; then
  echo '# Rebase Scratchpad' > docs/rebase-scratch.md
  commit_if_changed "wip: start rebase notes"
  printf '\n- remember squash\n' >> docs/rebase-scratch.md
  commit_if_changed "update notes"
  printf '\n- add fixup example\n' >> docs/rebase-scratch.md
  commit_if_changed "fixup! wip: start rebase notes"
  printf '\n- explain reword\n' >> docs/rebase-scratch.md
  commit_if_changed "docs: more rebase stuff"
  printf '\n- final checklist\n' >> docs/rebase-scratch.md
  commit_if_changed "oops final change"
fi

if create_branch cherry-pick/source-fixes; then
  replace_in_file src/main/java/com/gitmastery/payment/PaymentService.java '        if (discount == null || discount.isNegative()) {
            throw new ValidationException("Discount must not be negative");
        }
' '        if (discount == null || discount.isNegative()) {
            throw new ValidationException("Discount must not be negative");
        }
        if (discount.amount().compareTo(subtotal.amount()) > 0) {
            throw new ValidationException("Discount must not exceed subtotal");
        }
'
  commit_if_changed "fix: reject discounts above subtotal"
fi

if create_branch bisect/broken-payment-test; then
  printf '\n## Bisect Branch Notes\n\nThis branch intentionally breaks payment tax calculation so `git bisect run mvn -q test` can find the regression.\n' >> labs/12-bisect-debugging/README.md
  commit_if_changed "test: document payment regression expectation"
  replace_in_file src/main/java/com/gitmastery/payment/PaymentService.java '        Money tax = subtotal.multiply(taxRate);
        return subtotal.add(tax).subtract(discount);
' '        Money tax = subtotal.multiply(taxRate.movePointLeft(2));
        return subtotal.add(tax).subtract(discount);
'
  commit_if_changed "feat: optimize payment tax calculation"
fi

if create_branch hotfix/payment-rounding bisect/broken-payment-test; then
  replace_in_file src/main/java/com/gitmastery/payment/PaymentService.java '        Money tax = subtotal.multiply(taxRate.movePointLeft(2));
        return subtotal.add(tax).subtract(discount);
' '        Money tax = subtotal.multiply(taxRate);
        return subtotal.add(tax).subtract(discount);
'
  commit_if_changed "fix: restore payment tax calculation"
fi

if create_branch release/v1.0.0; then
  printf '\n## Release Branch Checklist\n\n- Run `mvn test`.\n- Verify tags `v1.0.0-rc1` and `v1.0.0`.\n- Prepare release notes from `CHANGELOG.md`.\n' >> CHANGELOG.md
  commit_if_changed "chore: prepare v1.0.0 release branch"
fi

if create_branch stash/wip-notification; then
  cat > labs/05-stash-clean-restore/WIP_NOTIFICATION_CHANGE.md <<'EOF_STASH_WIP'
# Stash WIP Instructions

This branch is intentionally used for local uncommitted work practice.

Try this:

```bash
printf '\n// local WIP formatter idea\n' >> src/main/java/com/gitmastery/notification/ConsoleNotificationService.java
git status
git stash push -m "wip notification formatter"
git switch main
git switch stash/wip-notification
git stash pop
```
EOF_STASH_WIP
  commit_if_changed "docs: add stash wip instructions"
fi

if create_branch revert/bad-feature; then
  replace_in_file src/main/java/com/gitmastery/payment/FakePaymentGateway.java '        return orderId != null && !amount.isNegative() && method != null;
' '        return true;
'
  commit_if_changed "feat: auto approve all fake payments"
fi

if create_branch worktree/hotfix-demo; then
  printf '\n## Worktree Hotfix Demo\n\nUse this branch from a separate worktree to practice urgent fixes while another branch is checked out.\n' >> docs/workflows/gitflow-workflow.md
  commit_if_changed "docs: add worktree hotfix demo notes"
fi

run git switch "$BASE_BRANCH" >/dev/null

echo
echo "Created or verified practice branches and tags."
echo
echo "Next commands to inspect locally:"
echo "  git log --oneline --graph --decorate --all"
echo "  git tag --list"
echo "  bash scripts/print-command-checklist.sh"
echo
echo "To push branches and tags explicitly:"
echo "  CONFIRM_PUSH=yes bash scripts/create-lab-branches.sh --push"
echo

if [[ "$PUSH" == true ]]; then
  if [[ "${CONFIRM_PUSH:-no}" != "yes" ]]; then
    echo "Push requested, but CONFIRM_PUSH=yes was not set. Nothing pushed."
    exit 0
  fi
  for branch in "${practice_branches[@]}"; do
    run git push -u "$REMOTE" "$branch"
  done
  for tag in "${tags[@]}"; do
    run git push "$REMOTE" "$tag"
  done
fi

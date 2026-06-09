# Gitflow Workflow

Gitflow uses long-lived `main` and `develop` branches plus feature, release, and hotfix branches.

## Branches

- `main`: production-ready releases.
- `develop`: integration branch.
- `feature/*`: new work from `develop`.
- `release/*`: stabilization before production.
- `hotfix/*`: urgent production fixes from `main`.

## Practice

Use `develop`, `release/v1.0.0`, and `hotfix/payment-rounding` from this lab.

## Worktree Hotfix Demo

Use this branch from a separate worktree to practice urgent fixes while another branch is checked out.

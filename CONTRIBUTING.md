# Contributing

This repository is a learning lab. Keep changes small, intentional, and easy to inspect with Git.

## Commit Style

Use conventional commits:

```text
feat: add order lookup
fix: handle blank user email
test: add payment rounding test
docs: add rebase lab notes
chore: update Maven CI
```

## Pull Request Checklist

- Explain what changed and why.
- Run `mvn test` locally.
- Include screenshots or logs when workflow behavior changes.
- Keep generated files out of commits unless the lab explicitly needs them.
- Avoid real secrets, tokens, passwords, private keys, or customer data.

## Branch Naming

Use clear names:

- `feature/<topic>`
- `bugfix/<topic>`
- `hotfix/<topic>`
- `release/<version>`
- `docs/<topic>`
- `lab/<topic>`

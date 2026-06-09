# Objects, Refs, HEAD, And Index

Git stores content as objects: blobs, trees, commits, and tags.

```bash
git hash-object README.md
git cat-file -t HEAD
git cat-file -p HEAD
git ls-tree HEAD
git show-ref
git rev-parse HEAD
```

- `HEAD` points to the current branch or commit.
- A branch is a movable ref under `.git/refs/heads`.
- The index is the staging area used to build the next commit.

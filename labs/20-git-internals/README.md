# Git Internals

        ## 1. Concept Explanation

        Inspect objects, refs, trees, and repository health.

        ## 2. Commands To Run

        ```bash
        git cat-file -t HEAD
git cat-file -p HEAD
git hash-object README.md
git ls-tree HEAD
git rev-parse HEAD
git show-ref
git update-ref refs/heads/internals/demo HEAD
git fsck
git gc
git maintenance run
        ```

        ## 3. Expected Output Or Expected State

        You can connect porcelain commands to Git objects and refs.

        ## 4. Practice Task

        Create an experimental ref with `update-ref`, inspect it, then delete it.

        ## 5. Common Mistakes

        Editing `.git` manually without understanding refs, or running cleanup during active operations.

        ## 6. Recovery Commands

        ```bash
        git update-ref -d refs/heads/internals/demo
git fsck --full
        ```

        ## 7. Interview Questions

        - What is a commit object pointing to?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A repository has dangling commits after a reset and you need to inspect them safely.

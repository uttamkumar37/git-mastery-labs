# Git Hooks

        ## 1. Concept Explanation

        Install local hooks to catch mistakes before commit or push.

        ## 2. Commands To Run

        ```bash
        bash scripts/install-hooks.sh
ls .git/hooks
git commit -m "bad message"
git commit -m "docs: good message"
        ```

        ## 3. Expected Output Or Expected State

        The sample hook checks commit message style and reminds you to run tests.

        ## 4. Practice Task

        Install hooks and try a non-conventional commit message on a disposable branch.

        ## 5. Common Mistakes

        Assuming local hooks are shared automatically or making hooks too slow.

        ## 6. Recovery Commands

        ```bash
        rm .git/hooks/commit-msg
git commit --no-verify
        ```

        ## 7. Interview Questions

        - Why should CI still validate rules enforced by local hooks?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A team wants quick local feedback but cannot rely only on developer machines.

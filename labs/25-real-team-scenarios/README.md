# Real Team Scenarios

        ## 1. Concept Explanation

        Combine Git skills into realistic Java team workflows.

        ## 2. Commands To Run

        ```bash
        git fetch origin
git log --oneline --graph --decorate --all
git pull --rebase
git merge --no-ff
git revert
git cherry-pick
git bisect run mvn -q test
        ```

        ## 3. Expected Output Or Expected State

        You can choose the right Git command for the situation instead of memorizing isolated syntax.

        ## 4. Practice Task

        Simulate a PR conflict, a rejected push, a bad commit revert, and a cherry-picked hotfix.

        ## 5. Common Mistakes

        Using one favorite command for every problem, or skipping communication when history is rewritten.

        ## 6. Recovery Commands

        ```bash
        git reflog
git merge --abort
git rebase --abort
git cherry-pick --abort
        ```

        ## 7. Interview Questions

        - How would you teach a junior developer to recover from a bad rebase?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A release train has a hotfix, two feature branches, one failing test, and a non-fast-forward push error.

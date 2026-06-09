# Status, Add, Commit, And Diff

        ## 1. Concept Explanation

        Practice the working tree, index, and commits with real Java and Markdown edits.

        ## 2. Commands To Run

        ```bash
        git status
git diff
git add README.md
git diff --staged
git commit -m "docs: practice commit flow"
git show HEAD
        ```

        ## 3. Expected Output Or Expected State

        Changes move from working tree to index to commit. `git show HEAD` displays the committed patch.

        ## 4. Practice Task

        Edit one lab README, stage it, inspect staged diff, then commit it.

        ## 5. Common Mistakes

        Using `git add .` without checking `git diff`, committing generated files, or forgetting tests before commit.

        ## 6. Recovery Commands

        ```bash
        git restore README.md
git restore --staged README.md
git reset --soft HEAD~1
        ```

        ## 7. Interview Questions

        - What is the difference between unstaged and staged changes?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        You are preparing a small PR and must keep unrelated local edits out of the commit.

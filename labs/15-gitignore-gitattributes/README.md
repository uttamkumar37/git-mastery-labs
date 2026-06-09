# Gitignore And Gitattributes

        ## 1. Concept Explanation

        Control ignored files and cross-platform line endings.

        ## 2. Commands To Run

        ```bash
        git check-ignore -v .idea/workspace.xml
git status --ignored
git add -f ignored-file
git ls-files --eol
        ```

        ## 3. Expected Output Or Expected State

        IDE files are ignored and text files have predictable line endings.

        ## 4. Practice Task

        Create a temporary ignored file and verify why Git ignores it.

        ## 5. Common Mistakes

        Adding secrets to `.gitignore` after they were already committed, or ignoring files needed by CI.

        ## 6. Recovery Commands

        ```bash
        git rm --cached <file>
git restore --staged <file>
        ```

        ## 7. Interview Questions

        - What does `.gitattributes` solve that `.gitignore` does not?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        Windows and Linux developers keep changing line endings in PRs.

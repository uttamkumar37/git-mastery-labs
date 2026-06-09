# Submodule And Subtree

        ## 1. Concept Explanation

        Understand external repository strategies without adding real dependencies.

        ## 2. Commands To Run

        ```bash
        git submodule add <url> vendor/example-lib
git submodule status
git subtree add --prefix vendor/example-lib <url> main --squash
        ```

        ## 3. Expected Output Or Expected State

        You can explain the difference without needing a real external dependency in this lab.

        ## 4. Practice Task

        Read the commands and write when you would choose each approach.

        ## 5. Common Mistakes

        Forgetting submodule initialization or vendoring code without ownership clarity.

        ## 6. Recovery Commands

        ```bash
        git submodule deinit -f vendor/example-lib
git rm -f vendor/example-lib
        ```

        ## 7. Interview Questions

        - Why can submodules surprise new team members?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A shared utility library must be consumed by multiple services.

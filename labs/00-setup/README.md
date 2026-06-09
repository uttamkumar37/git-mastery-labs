# Environment Setup

        ## 1. Concept Explanation

        Prepare Java, Maven, Git identity, editor, aliases, and a safe practice workspace.

        ## 2. Commands To Run

        ```bash
        git --version
java -version
mvn -version
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
        ```

        ## 3. Expected Output Or Expected State

        Git identity is configured and `mvn test` passes on `main`.

        ## 4. Practice Task

        Configure your Git identity, run tests, and add one local alias for `git status --short --branch`.

        ## 5. Common Mistakes

        Using a work email in personal repos, missing Java 17, or configuring aliases without understanding the original command.

        ## 6. Recovery Commands

        ```bash
        git config --global --unset alias.st
git config --global --list --show-origin
        ```

        ## 7. Interview Questions

        - How do local, global, and system Git config levels differ?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A new team member joins and must reproduce the project locally before touching code.

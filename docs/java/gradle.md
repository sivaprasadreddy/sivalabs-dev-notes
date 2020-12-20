# Gradle

[Gradle](https://gradle.org/) is a powerful build tool.

## Installation

`sdk install gradle`

## References
* <https://gradle.org/guides/#getting-started>
* <https://docs.gradle.org/current/userguide/userguide.html>

## Execute Shell commands

```groovy
//To run a shell script
task runMyScript(type:Exec) {
    workingDir '.'
    commandLine 'sh', './run.sh'
}

//To run a single command
task buildDockerImage(type:Exec) {
    executable "sh"
    args "-c", "docker build -t sivaprasadreddy/spring-boot-todolist ."
}

//To run multiple commands
task runMultipleCommands() {
    exec {
        executable "sh"
        args "-c", 'touch test2.txt'
    }
    exec {
        executable "sh"
        args "-c", 'touch test3.txt'
    }
}
```
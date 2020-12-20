# Shortcuts

## Intellij IDEA

- Extend Selection: ⌥ + ↑
- Shrink Selection: ⌥ + ↓
- Show clipboard: ⌘ + ⇧ + V
- Format Current File: ⌥ + ⌘ + L
- Organize Imports: ⌃ + ⌥ + O
- Expand/Collapse Method: ⌘ + +/-
- Expand/Collapse all Methods: ⌘ + ⇧ + +/-
- Extract to variable: ⌘ + ⌥ + V
- Extract to method: ⌘ + ⌥ + M
- File Structure: ⌘ + F12

## Git Tips

[OhMyZsh Git CheatSheet](https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet)

### Git Stash

`git status`
`git stash` -> only stash tracked files (indexed, modified files)
`git stash pop`

`git stash apply` -> reapply the changes to your working copy and keep them in your stash

`git stash -u` -> also stash your untracked files
`git stash -a` -> also stash your changes to ignored files

`git stash list`
`git stash save "add style to our site"`

By default, `git stash pop` will re-apply the most recently created stash: stash@{0}

`git stash pop stash@{2}`

`git stash branch branch-name stash@{1}`

`git stash drop stash@{1}`

`git stash clear`

http://sushihangover.github.io/iterm2-osx-jump-word-wise-left-and-right-in-navigation/

## Working with open source

```shell
git clone https://github.com/sivaprasadreddy/spring-boot.git
cd spring-boot
git remote add upstream https://github.com/spring-projects/spring-boot.git
git remote -v
git fetch upstream
git checkout master
git merge upstream/master
git push
```

## Reset to Upstream

* Ensures current branch is master `$ git checkout master`
* Pulls all new commits made to upstream/master `$ git pull upstream master`
* To remove all your local changes to master `$ git reset --hard upstream/master`

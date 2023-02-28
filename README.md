# Kuro's Config Dump

Here are my scripts I need for my machines to keep an optimal and consistent workflow uwu

## Running the scripts

### PowerShell

> **Note**
> Running `setup.ps1` will require admin privilages and allow the script by
> bypassing its Execution Policy:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\setup.ps1
```

## Aliases

> 💅 This is for personal preference only - this what I found to be efficient to my desired workflow!

### Git

| Alias   | Command                   |
| ------- | ------------------------- |
| `gaa`   | `git add --all`           |
| `gb`    | `git branch`              |
| `gc`    | `git commit -m`           |
| `gcl`   | `git clone`               |
| `gch`   | `git checkout`            |
| `gcho`  | `git checkout --orphan`   |
| `gf`    | `git fetch`               |
| `gfl`   | `gf && gl`                |
| `gl`    | `git pull`                |
| `gp`    | `git push`                |
| `gpu`   | `git push --set-upstream` |
| `grl`   | `git reflog .`            |
| `grc`   | `git rm -r --cached .`    |
| `gs`    | `git status -sb`          |
| `gsync` | `grc && gaa`              |

### Docker (Linux only)

| Alias | Command               |
| ----- | --------------------- |
| `dp`  | `docker ps`           |
| `dpl` | `docker pull`         |
| `dps` | `docker push`         |
| `dr`  | `docker run`          |
| `dcu` | `docker-compose up`   |
| `dcd` | `docker-compose down` |

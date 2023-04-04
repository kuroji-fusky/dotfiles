"""
Updates aliases and stuff because updating them from Bash and PowerShell scripts
are tedious and paINFUL OH GOD HELP ME AAAAAAAAA
"""
git_aliases: dict[str, str] = {
    'gb': 'git branch',
    'gch': 'git checkout',
    'gc': 'git clone',
    'gcho': 'git checkout --orphan',
    'ga': 'git add -A .',
    'gl': 'git pull',
    'gp': 'git push',
    'gpu': 'git push -u',
    'gf': 'git fetch',
    'gfl': 'gf; gl',
    'grc': 'git rm -r --cached .; ga',
    'grl': 'git reflog',
    'gs': 'git status -sb',
}

misc_aliases: dict[str, str] = {
    'codei': 'code-insiders',
    '..': 'cd ..',
    '...': 'cd ../..',
    '....': 'cd ../../..',
    'ls': 'ls --color=auto',
    'la': 'ls -la'
}


def main():
    for aliases in [*git_aliases, *misc_aliases]:

        # do stuff here
        with open('bash/aliases', 'a+'):
            print("stuff")

        with open('pwsh/aliases.ps1', 'a+'):
            print("stuff")


if __name__ == "__main__":
    main()

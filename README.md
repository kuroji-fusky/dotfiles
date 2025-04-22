# My "dotfiles" repo

Here are my scripts I need for my machines to keep an optimal and consistent workflow

## Windows

### Running the bootstrap script

> [!NOTE]
> Running `bootstrap.ps1` will require admin privilages and allow the script by
> bypassing its Execution Policy:

```ps1
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser; .\win\bootstrap.ps1
```

### Installing pre-defined programs

Assuming you've already on the root directory in this repository and have `winget`
installed on your system; simply run:

```ps1
winget import .\win\winget.json --accept-package-agreements --verbose
```

The `--verbose` flag makes you look cool~
# Kuro's Config Dump and dotfiles

Here are my scripts I need for my machines to keep an optimal and consistent workflow

----

> **Note**
> Running `bootstrap.ps1` will require admin privilages and allow the script by
> bypassing its Execution Policy:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser; .\bootstrap.ps1
```

## Todo

- [ ] `bootstrap.ps1` needs to check for additonal files so it can run on its own and
  download them via `Invoke-WebRequest`
- [ ] Remove Windows 11 bloat when running `bootstrap.ps1`
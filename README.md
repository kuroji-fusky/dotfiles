# Kuro's Config Dump and dotfiles

Here are my scripts I need for my machines to keep an optimal and consistent workflow

----

> [!NOTE]
> Running `bootstrap.ps1` will require admin privilages and allow the script by
> bypassing its Execution Policy:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser; .\bootstrap.ps1
```

## Python setup

For development, initialize a virtual environment.

```console
py -m venv venv
source venv/Scripts/activate

# Windows
.\venv\Scripts\activate
```

Then, install the good stuff:

```console
pip install -r requirements.txt
```

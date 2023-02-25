import os
import os.path


def main():
    steam_path = "D:\\SteamLibrary\\steamapps\\common"
    for dirpath, _, filenames in os.walk(steam_path):
        for filename in [f for f in filenames if f.endswith("autoexec.cfg")]:
            print(os.path.join(dirpath, filename))


if __name__ == "__main__":
    main()

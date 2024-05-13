from yt_dlp import YoutubeDL as yt

import argparse
import json

parser = argparse.ArgumentParser()

download_modes = ["default", "music", "archive",
                  "d", "m", "a"]

parser.add_argument("--mode",
                    "-M",
                    nargs="*",
                    default=download_modes[0],
                    const=download_modes[0],
                    choices=download_modes,
                    required=False,
                    type="str",
                    help="A mode what video to download")

args = parser.parse_args()


def main():
    # will do stuff with yt-dlp here soon
    ...


if __name__ == "__main__":
    main()

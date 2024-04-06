import yt_dlp
import argparse

parser = argparse.ArgumentParser()

parser.add_argument("--music-mode",
                    action="store_true",
                    help="Downloads all the defined URLs as mp3")
parser.add_argument("--archive-mode",
                    action="store_true",
                    help="Will download almost everything necessary for archival storage")

args = parser.parse_args()


def main():
    # will do stuff with yt-dlp here soon
    ...


if __name__ == "__main__":
    main()

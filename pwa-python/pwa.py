import argparse
from generator import Logger
from generator import GenerateManifest

# =============================
# Command line arg parsers
# =============================
parser = argparse.ArgumentParser(
    description="Generate PWAs through the command-line!")

parser.add_argument("-T", "--title", required=False)
parser.add_argument("-bg", "--bg-color", required=False)
parser.add_argument("-tg", "--theme-color", required=False)
parser.add_argument("-D", "--description", required=False)
parser.add_argument("-U", "--start-url", required=False)
parser.add_argument("-I", "--icons", required=False)

args = parser.parse_args()


def main():
    Logger.error("Error test")
    Logger.warn("Warn test")
    Logger.info("Info test")

    manifest = GenerateManifest(name="Le PWA App")
    manifest.parse_json()


if __name__ == "__main__":
    main()
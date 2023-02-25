from typing import Literal, Optional, TypedDict
from InquirerPy import prompt
from colorama import Back, Fore, Style
import json
import cv2

B_RED, B_YELLOW, B_GREEN, B_BLUE = (
    Back.LIGHTRED_EX,
    Back.YELLOW,
    Back.LIGHTGREEN_EX,
    Back.LIGHTBLUE_EX,
)
F_RED, F_YELLOW, F_GREEN, F_BLUE = (
    Fore.LIGHTRED_EX,
    Fore.YELLOW,
    Fore.LIGHTGREEN_EX,
    Fore.LIGHTBLUE_EX,
)
F_BLACK, F_WHITE = Fore.LIGHTBLACK_EX, Fore.LIGHTWHITE_EX
RST = Style.RESET_ALL


class Logger:

    @staticmethod
    def error(msg: str):
        print(f"{B_RED}{F_BLACK}[err!]{RST} {msg}")

    @staticmethod
    def warn(msg: str):
        print(f"{B_YELLOW}{F_BLACK}[warn]{RST} {msg}")

    @staticmethod
    def info(msg: str):
        print(f"{F_BLUE}{msg}{RST}")


Purpose = Literal["monochrome", "maskable", "any"]
ImageTypes = Literal["image/png", "image/svg+xml", "image/jpg", "image/webp"]


class Icons(TypedDict):
    src: str
    sizes: int | Optional[list[int]]
    type: Optional[ImageTypes | str]
    purpose: Optional[Purpose]


class Shortcuts(TypedDict):
    src: str
    sizes: int | Optional[list[int]]
    type: Optional[ImageTypes | str]
    purpose: Optional[Purpose | list[Purpose]]


class GenerateManifest:
    Display = Literal["browser", "standalone", "material-ui", "fullscreen"]
    Orientation = Literal["any", "portrait", "landscape"]

    def __init__(
        self,
        name: str,
        short_name: Optional[str] = None,
        description: Optional[str] = None,
        theme_color: str = "#000",
        bg_color: str = "#fff",
        start_url: str = "/",
        scope: str = "/",
        display: Display | None = "standalone",
        orientation: Orientation | None = "any",
    ):
        self.pwa_json: dict[str, str] = {}

        self.name = name
        self.short_name = short_name
        self.description = description
        self.theme_color = theme_color
        self.bg_color = bg_color
        self.start_url = start_url
        self.display = display
        self.scope = scope
        self.orientation = orientation

        # TODO: Make sure the logo provided is 512x512, if not, then throw a warning for a better
        # TODO: image quality and resize the image anyway

    def parse_json(self):
        pwa_dict = self.pwa_json
        pwa_dict.update({
            "name":
            self.name,
            "short_name":
            self.name if self.short_name is None else self.short_name,
            "background_color":
            self.bg_color,
            "theme_color":
            self.theme_color,
            "start_url":
            self.start_url,
            "scope":
            self.scope,
            "display":
            self.display,
            "orientation":
            self.orientation,
        })

        print(json.dumps(pwa_dict, indent=2))

    def icons(self, variants: list[Icons]):
        # TODO: OpenCV stuff here to resize images
        pass

    def shortcuts(self, variants: list[Shortcuts]):
        pass

    def generate_splash(self, sizes: list[int]):
        # TODO: Generate HTML file here for various sizes and OpenCV to take the background color and
        # TODO: center the image
        pass

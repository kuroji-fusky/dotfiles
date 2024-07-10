import os
import stat
import re
from typing import Literal, LiteralString
from datetime import datetime

import yaml

CURRENT_DATE = datetime.now().strftime("%B %d, %Y %H:%M")
AUTOGEN_MSG = f"This file is auto-generated; last modified on {CURRENT_DATE}"

_OS = Literal['win', 'unix']


def parse_alias(alias_collection: list[dict], os: _OS = 'win') -> LiteralString:
    [system_is_unix, system_is_windows] = [os == 'unix', os == 'win']
    _processed_file_output = []
    _processed_aliases = []

    def parse_positional_args(input_str: str, replace_with: str) -> str:
        """Matches something that has `{{n}}` or `{{n ?> <default value>}}` in a command"""
        # ? consider adding support for env vars with "{{#env.something}}" perhaps?
        # ? example: "node yourmom.js {{#env.NODE_ENV = 'production'}}"
        pos_arg_pattern = re.match(r"({{\d}}|{{\d\s\?\>\s.*}})")

    def _append_alias(x: str) -> None:
        return _processed_aliases.append(x)

    # Push the current date first before the rest
    _append_alias(f"# {AUTOGEN_MSG}")

    if system_is_unix:
        _append_alias("#!/bin/sh")

    for alias_section in alias_collection:
        if 'outputs' in alias_section:
            print(alias_section)

        if 'label' in alias_section:
            _append_alias(f"\n# LABEL: {alias_section['label']}\n")

        if 'aliases' in alias_section:
            alias_list = alias_section['aliases']

            for alias_item in alias_list:
                if system_is_windows:
                    _append_alias(
                        ''.join([f'function {a[0]} {{ & {a[1]} }}' for a in alias_item.items()])  # noqa
                    )

                if system_is_unix:
                    _append_alias(
                        ''.join([f'alias {a[0]}=\"{a[1]}\"' for a in alias_item.items()])  # noqa
                    )

    parsed_output = "\n".join(_processed_aliases)

    return parsed_output


def main():
    def save_executable(parsed_str: LiteralString) -> None:
        ...

    with open("aliases.yml", "r", encoding="utf-8") as st:
        alias_root = yaml.safe_load(st)

    global_alias = parse_alias(alias_root['global'])
    global_alias_unix = parse_alias(alias_root['global'], 'unix')
    win_alias = parse_alias(alias_root['windows'])
    unix_alias = parse_alias(alias_root['unix'], 'unix')

    print(global_alias_unix)


if __name__ == "__main__":
    main()

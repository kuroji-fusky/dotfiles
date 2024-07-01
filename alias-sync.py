import yaml
from datetime import datetime
from typing import Literal

CURRENT_DATE = datetime.now().strftime("%B %d, %Y %H:%M")
AUTOGEN_MSG = f"This file is auto-generated; last modified on {CURRENT_DATE}"


# WIP
def parse_positional_args():
    pass


_OS = Literal['win', 'unix']


def parse_alias(alias_collection: list[dict], os: _OS = 'win'):
    [system_is_unix, system_is_windows] = [os == 'unix', os == 'win']

    _processed_aliases = []

    if system_is_unix:
        _processed_aliases.append("#!/bin/sh")

    # Push the current date first before the rest
    _processed_aliases.append(f"# {AUTOGEN_MSG}")

    for alias_section in alias_collection:
        if 'label' in alias_section:
            _processed_aliases.append(
                f"\n#\n# LABEL: {alias_section['label']}\n#\n")

        alias_list = alias_section['aliases']

        for alias_item in alias_list:
            if system_is_windows:
                _processed_aliases.append(
                    ''.join([f'function {a[0]} {{ & {a[1]} }}' for a in alias_item.items()]))

    # Join everything
    print("\n".join(_processed_aliases))


def main():
    with open("aliases.yml", "r", encoding="utf-8") as st:
        alias_root = yaml.safe_load(st)

    global_alias = parse_alias(alias_root['global'])
    win_alias = parse_alias(alias_root['windows'])
    unix_alias = parse_alias(alias_root['unix'], 'unix')


if __name__ == "__main__":
    main()

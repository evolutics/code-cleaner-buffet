#!/usr/bin/env python3

import argparse

from maintenance import generate_buffet


def main() -> None:
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers()

    subparser = subparsers.add_parser("generate_buffet")
    subparser.set_defaults(function=generate_buffet.main)

    arguments = parser.parse_args()
    arguments.function(arguments)


if __name__ == "__main__":
    main()
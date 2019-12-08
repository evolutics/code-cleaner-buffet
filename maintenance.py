#!/usr/bin/env python3

import argparse

from maintenance import generate_buffet
from maintenance import update_helpers


def main():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers()

    subparser = subparsers.add_parser("generate_buffet")
    subparser.set_defaults(function=generate_buffet.main)

    subparser = subparsers.add_parser("update_helpers")
    subparser.set_defaults(function=update_helpers.main)

    arguments = parser.parse_args()
    arguments.function(arguments)


if __name__ == "__main__":
    main()

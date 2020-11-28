#!/usr/bin/env python3

import argparse
import json
import os
import pathlib
import subprocess


def main():
    os.chdir(pathlib.Path(os.path.realpath(__file__)).parent.parent)

    parser = argparse.ArgumentParser()
    parser.add_argument("--tag", default=_get_latest_tag())
    arguments = parser.parse_args()

    _generate_dockerfile()
    _generate_readme(arguments.tag)
    _commit()


def _get_latest_tag():
    return subprocess.run(
        ["git", "describe", "--abbrev=0"],
        capture_output=True,
        check=True,
        text=True,
    ).stdout.rstrip()


def _generate_dockerfile():
    with pathlib.Path("Dockerfile").open("w") as dockerfile:
        subprocess.run(["buffet", "assemble", "dishes"], check=True, stdout=dockerfile)


def _generate_readme(tag):
    _generate_template_partials(tag)
    with pathlib.Path("README.md").open("w") as readme:
        subprocess.run(
            [
                "buffet",
                "document",
                "--template",
                "docs/readme/README.md.mustache",
                "dishes",
            ],
            check=True,
            stdout=readme,
        )


def _generate_template_partials(tag):
    intermediate = json.loads(
        subprocess.run(
            ["buffet", "parse", "dishes"], check=True, stdout=subprocess.PIPE
        ).stdout
    )
    dish_example_versions = {
        option: dish["metadata"]["tags"]["info.evolutics.buffet.version-example"][-1]
        for option, dish in intermediate["option_to_dish"].items()
    }
    generated_partials = {
        "black.md.mustache": dish_example_versions["black"],
        "prettier.md.mustache": dish_example_versions["prettier"],
        "tag.md.mustache": tag,
    }
    for filename, content in generated_partials.items():
        path = pathlib.Path("docs") / "readme" / filename
        path.write_text(content)


def _commit():
    subprocess.run(
        ["git", "commit", "--all", "--message", "Generate buffet with documentation"],
        check=True,
    )


if __name__ == "__main__":
    main()

#!/usr/bin/env python3

import json
import os
import pathlib
import subprocess


def main():
    os.chdir(pathlib.Path(os.path.realpath(__file__)).parent.parent)

    _generate_dockerfile()
    _generate_readme()
    _commit()


def _generate_dockerfile():
    with pathlib.Path("Dockerfile").open("w") as dockerfile:
        subprocess.run(["buffet", "assemble", "dishes"], check=True, stdout=dockerfile)


def _generate_readme():
    _generate_template_partials()
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


def _generate_template_partials():
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
        "tag.md.mustache": subprocess.run(
            ["git", "describe", "--abbrev=0"],
            capture_output=True,
            check=True,
            text=True,
        ).stdout.rstrip(),
    }
    for filename, content in generated_partials.items():
        path = pathlib.Path("docs") / "readme" / filename
        with path.open("w") as partial:
            partial.write(content)


def _commit():
    subprocess.run(
        ["git", "commit", "--all", "--message", "Generate buffet with documentation"],
        check=True,
    )


if __name__ == "__main__":
    main()

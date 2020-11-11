#!/usr/bin/env python3

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
    generated_partials = {
        "tag.md.mustache": subprocess.run(
            ["git", "describe", "--abbrev=0"],
            capture_output=True,
            check=True,
            text=True,
        ).stdout.rstrip()
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

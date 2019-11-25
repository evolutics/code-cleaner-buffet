import subprocess
import typing


def main(arguments: typing.Any) -> None:
    _generate_dockerfile()
    _generate_readme()
    _commit()


def _generate_dockerfile() -> None:
    with open("Dockerfile", "w") as dockerfile:
        subprocess.run(["buffet", "build", "dishes"], check=True, stdout=dockerfile)


def _generate_readme() -> None:
    with open("README.md", "w") as readme:
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


def _commit() -> None:
    subprocess.run(
        ["git", "commit", "--all", "--message", "Generate buffet with documentation"],
        check=True,
    )

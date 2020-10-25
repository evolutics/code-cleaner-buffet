import pathlib
import subprocess


def main(_):
    _generate_dockerfile()
    _generate_readme()
    _commit()


def _generate_dockerfile():
    with pathlib.Path("Dockerfile").open("w") as dockerfile:
        subprocess.run(["buffet", "assemble", "dishes"], check=True, stdout=dockerfile)


def _generate_readme():
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


def _commit():
    subprocess.run(
        ["git", "commit", "--all", "--message", "Generate buffet with documentation"],
        check=True,
    )

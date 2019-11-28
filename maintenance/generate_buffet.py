import subprocess


def main(arguments):
    _generate_dockerfile()
    _generate_readme()
    _commit()


def _generate_dockerfile():
    with open("Dockerfile", "w") as dockerfile:
        subprocess.run(["buffet", "build", "dishes"], check=True, stdout=dockerfile)


def _generate_readme():
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


def _commit():
    subprocess.run(
        ["git", "commit", "--all", "--message", "Generate buffet with documentation"],
        check=True,
    )

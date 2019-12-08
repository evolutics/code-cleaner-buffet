import csv
import hashlib
import io
import pathlib
import subprocess


def main(arguments):
    _build_and_push("haskell_stack")


def _build_and_push(helper):
    image = "evolutics/code-cleaner-buffet"

    tag_base = helper.replace("_", "-")
    image_if_disabled = f"{image}:{tag_base}-"
    base_image = "alpine:3.10.3"
    subprocess.run(["docker", "pull", base_image], check=True)
    subprocess.run(["docker", "tag", base_image, image_if_disabled], check=True)
    subprocess.run(["docker", "push", image_if_disabled], check=True)

    helper_folder = pathlib.Path("helpers") / helper
    digest = _hash_folder(helper_folder)[:16]
    image_if_enabled = f"{image_if_disabled}{digest}"
    subprocess.run(
        ["docker", "build", "--tag", image_if_enabled, helper_folder], check=True
    )
    subprocess.run(["docker", "push", image_if_enabled], check=True)


def _hash_folder(folder):
    ordered_files = [path for path in sorted(folder.glob("**/*")) if path.is_file()]
    file_digests = io.StringIO()
    file_digests_table = csv.writer(file_digests)
    for file in ordered_files:
        file_digests_table.writerow([file.relative_to(folder), _hash_file(file)])
    return _hash(file_digests.getvalue().encode())


def _hash_file(path):
    return _hash(path.read_bytes())


def _hash(data):
    digest = hashlib.sha256()
    digest.update(data)
    return digest.hexdigest()

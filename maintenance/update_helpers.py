import csv
import hashlib
import io
import pathlib
import subprocess


def main(arguments):
    for helper in sorted(pathlib.Path("helpers").iterdir()):
        if helper.is_dir():
            _update_helper(helper)


def _update_helper(helper):
    image_if_disabled = _image_if_disabled(helper)
    _update_image_if_disabled(image_if_disabled)
    _update_image_if_enabled(image_if_disabled, helper)


def _image_if_disabled(helper):
    tag_base = helper.name.replace("_", "-")
    return f"evolutics/code-cleaner-buffet:{tag_base}-"


def _update_image_if_disabled(image):
    base_image = "alpine:3.12.0"
    subprocess.run(["docker", "pull", base_image], check=True)
    subprocess.run(["docker", "tag", base_image, image], check=True)
    subprocess.run(["docker", "push", image], check=True)


def _update_image_if_enabled(image_if_disabled, helper):
    digest = _hash_folder(helper)[:16]
    image = f"{image_if_disabled}{digest}"
    subprocess.run(["docker", "build", "--tag", image, helper], check=True)
    subprocess.run(["docker", "push", image], check=True)


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

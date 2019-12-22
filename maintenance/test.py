import contextlib
import json
import pathlib
import subprocess
import sys
import tempfile
import traceback
import yaml


def main(arguments):
    ir = _parse_ir()
    dish_to_versions = _filter_map(_get_dish_to_versions(ir), arguments.dishes)
    tests = _get_tests(dish_to_versions)
    _run_independent_tasks(tests)


def _parse_ir():
    return json.loads(
        subprocess.run(
            ["buffet", "parse", "dishes"], check=True, stdout=subprocess.PIPE
        ).stdout
    )


def _filter_map(key_to_value, key_regex):
    return {key: value for key, value in key_to_value.items() if key_regex.match(key)}


def _get_dish_to_versions(ir):
    return {
        option: dish["metadata"]["tags"]["info.evolutics.buffet.version-example"]
        for option, dish in ir["option_to_dish"].items()
    }


def _get_tests(dish_to_versions):
    for dish, versions in dish_to_versions.items():
        for version in versions:
            yield lambda: _test_dish_version(dish, version)


def _test_dish_version(dish, version):
    with _temporary_file(prefix=f"{dish}.") as arguments_path:
        with arguments_path.open("w") as arguments_file:
            yaml.dump({dish: version}, arguments_file)
        subprocess.run(
            ["buffet", "test", "--arguments", str(arguments_path), "dishes"], check=True
        )


@contextlib.contextmanager
def _temporary_file(prefix=None):
    file = tempfile.NamedTemporaryFile(delete=False, prefix=prefix)
    path = pathlib.Path(file.name)
    file.close()
    try:
        yield path
    finally:
        path.unlink()


def _run_independent_tasks(tasks):
    exceptions = []
    for task in tasks:
        try:
            task()
        except Exception:
            formatted_exception = traceback.format_exc()
            print(formatted_exception, file=sys.stderr)
            exceptions.append(formatted_exception)
    if exceptions:
        raise Exception("\n".join(exceptions))

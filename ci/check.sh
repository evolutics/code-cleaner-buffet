#!/bin/sh

set -o errexit
set -o nounset
set -o pipefail

check_with_git() {
  git diff --check HEAD^
}

check_with_hadolint() {
  git ls-files -z -- '*/Dockerfile' Dockerfile '*.Dockerfile' \
    | xargs -0 hadolint
}

check_with_hunspell() {
  git log -1 --format=%B | hunspell -l -d en_US -p ci/personal_words.dic \
    | sort | uniq | tr '\n' '\0' | xargs -0 -r -n 1 sh -c \
    'echo "Misspelling: $@"; exit 1' --
}

main() {
  check_with_git
  check_with_hadolint
  check_with_hunspell
}

main "$@"

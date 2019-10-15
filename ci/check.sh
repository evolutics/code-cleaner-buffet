#!/bin/sh

set -o errexit
set -o nounset
set -o pipefail

check_with_hadolint() {
  git ls-files -z -- '*/Dockerfile' Dockerfile '*.Dockerfile' \
    | xargs -0 hadolint
}

main() {
  check_with_hadolint
}

main "$@"

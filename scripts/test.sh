#!/bin/bash

set -o errexit -o nounset -o pipefail

main() {
  local -r script_folder="$(dirname "$(readlink --canonicalize "$0")")"
  cd "$(dirname "${script_folder}")"

  docker run --entrypoint sh --rm --volume "${PWD}":/workdir \
    evolutics/travel-kit:0.8.0 -c \
    'git ls-files -z | xargs -0 travel-kit check --'
}

main "$@"

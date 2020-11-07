#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

main() {
  local -r script_folder="$(dirname "$(readlink --canonicalize "$0")")"
  local -r project_folder="$(dirname "${script_folder}")"

  pushd "${project_folder}"

  docker run --entrypoint sh --rm --volume "$(pwd)":/workdir \
    evolutics/travel-kit:0.5.0 -c \
    'git ls-files -z | xargs -0 travel-kit check --'

  popd
}

main "$@"

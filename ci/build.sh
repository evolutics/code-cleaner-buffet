#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

main() {
  local -r script_folder="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  local -r project_folder="$(dirname "${script_folder}")"

  pushd "${project_folder}"

  docker run --rm --volume "$(pwd)":/workdir evolutics/travel-kit:0.1.0 check

  popd
}

main "$@"

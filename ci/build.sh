#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

main() {
  local -r script_folder="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  local -r project_folder="$(dirname "${script_folder}")"

  pushd "${project_folder}"

  local -r image_id="$(docker build --quiet \
    .)"
  docker run --rm --volume "$(pwd)":/workdir "${image_id}" ci/check.sh

  popd
}

main "$@"

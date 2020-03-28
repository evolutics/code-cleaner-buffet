#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

main() {
  local -r script_folder="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  local -r project_folder="$(dirname "${script_folder}")"

  pushd "${project_folder}"

  local -r image_id="$(docker build --quiet \
    --build-arg black=19.10b0 \
    --build-arg git=2.24.1 \
    --build-arg gitlint=0.13.1 \
    --build-arg hadolint=1.17.5 \
    --build-arg hunspell=1.7.0 \
    --build-arg prettier=2.0.2 \
    .)"
  docker run --rm --volume "$(pwd)":/workdir "${image_id}" ci/check.sh

  popd
}

main "$@"

#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

main() {
  local -r script_folder="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  local -r project_folder="$(dirname "${script_folder}")"

  pushd "${project_folder}"

  local -r image_id="$(docker build --quiet \
    --build-arg black=20.8b1 \
    --build-arg git=2.26.2 \
    --build-arg gitlint=0.13.1 \
    --build-arg hadolint=1.18.0 \
    --build-arg hunspell=1.7.0 \
    --build-arg prettier=2.1.2 \
    .)"
  docker run --rm --volume "$(pwd)":/workdir "${image_id}" ci/check.sh

  popd
}

main "$@"

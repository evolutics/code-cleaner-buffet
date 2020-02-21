#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

main() {
  local -r script_folder="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  local -r project_folder="$(dirname "${script_folder}")"

  pushd "${project_folder}"

  local -r image_id="$(docker build --quiet \
    --build-arg _apk_python3_dev=3.8.2 \
    --build-arg _apk_python3=3.8.2 \
    --build-arg black=19.10b0 \
    --build-arg git=2.24.1 \
    --build-arg gitlint=0.12.0 \
    --build-arg hadolint=1.17.3 \
    --build-arg hunspell=1.7.0 \
    --build-arg prettier=1.19.1 \
    .)"
  docker run --rm --volume "$(pwd)":/workdir "${image_id}" ci/check.sh

  popd
}

main "$@"

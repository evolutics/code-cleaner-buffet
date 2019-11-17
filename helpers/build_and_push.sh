#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

build_and_push() {
  pushd "$1"

  local -r image='evolutics/code-cleaner-buffet'

  local -r image_if_disabled="${image}:${1//_/-}-"
  local -r base_image='alpine:3.10.3'
  docker pull "${base_image}"
  docker tag "${base_image}" "${image_if_disabled}"
  docker push "${image_if_disabled}"

  local -r hash="$(find . -type f -exec sha256sum {} + \
    | sort | sha256sum | cut --characters -16)"
  local -r image_if_enabled="${image_if_disabled}${hash}"
  docker build --tag "${image_if_enabled}" .
  docker push "${image_if_enabled}"

  popd
}

main() {
  local -r script_folder="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  pushd "${script_folder}"

  build_and_push haskell_stack

  popd
}

main "$@"

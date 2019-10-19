#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

build_and_push() {
  pushd "$1"

  local -r alpine='3.10.2'
  local -r image='evolutics/code-cleaner-buffet'

  local -r image_if_disabled="${image}:${1//_/-}-"
  docker tag "alpine:${alpine}" "${image_if_disabled}"
  docker push "${image_if_disabled}"

  local -r image_if_enabled="${image_if_disabled}${alpine}"
  docker build --tag "${image_if_enabled}" --build-arg "alpine=${alpine}" .
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

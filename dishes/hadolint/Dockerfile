ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG hadolint
ARG hadolint_curl='7.66.0'

LABEL org.opencontainers.image.title='Haskell Dockerfile Linter'
LABEL org.opencontainers.image.url='https://github.com/hadolint/hadolint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Dockerfile'
LABEL info.evolutics.buffet.versions-url='https://github.com/hadolint/hadolint/releases'

RUN apk add --no-cache \
    "curl~=${hadolint_curl}" \
  && curl --fail --location --show-error --silent \
    "https://github.com/hadolint/hadolint/releases/download/v${hadolint}/hadolint-Linux-x86_64" \
    > /usr/local/bin/hadolint \
  && chmod +x /usr/local/bin/hadolint

WORKDIR /workdir

HEALTHCHECK CMD echo 'FROM foo:bar' | hadolint -

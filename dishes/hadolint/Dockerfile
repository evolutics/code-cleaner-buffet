ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG hadolint

LABEL org.opencontainers.image.title='Haskell Dockerfile Linter'
LABEL org.opencontainers.image.url='https://github.com/hadolint/hadolint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Dockerfile'
LABEL info.evolutics.buffet.versions-url='https://github.com/hadolint/hadolint/releases'
LABEL info.evolutics.buffet.version-example='2.4.0'

RUN wget --no-verbose --output-document /usr/local/bin/hadolint \
    "https://github.com/hadolint/hadolint/releases/download/v${hadolint}/hadolint-Linux-x86_64" \
  && chmod +x /usr/local/bin/hadolint

WORKDIR /workdir

HEALTHCHECK CMD hadolint --version \
  && echo 'FROM foo:bar' | hadolint -

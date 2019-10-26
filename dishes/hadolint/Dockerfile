ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG hadolint

LABEL org.opencontainers.image.title='Haskell Dockerfile Linter'
LABEL org.opencontainers.image.url='https://github.com/hadolint/hadolint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Dockerfile'
LABEL info.evolutics.buffet.versions-url='https://github.com/hadolint/hadolint/releases'

RUN wget --output-document /usr/local/bin/hadolint \
    "https://github.com/hadolint/hadolint/releases/download/v${hadolint}/hadolint-Linux-x86_64" \
  && chmod +x /usr/local/bin/hadolint

WORKDIR /workdir

HEALTHCHECK CMD echo 'FROM foo:bar' | hadolint -

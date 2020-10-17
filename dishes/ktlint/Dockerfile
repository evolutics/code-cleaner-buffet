ARG _alpine='3.12.0'

FROM alpine:"${_alpine}"
ARG _apk_openjdk11_jre_headless=''
ARG ktlint

LABEL org.opencontainers.image.title='ktlint'
LABEL org.opencontainers.image.url='https://ktlint.github.io'
LABEL info.evolutics.buffet.categories='Formatter,Linter'
LABEL info.evolutics.buffet.languages='Kotlin'
LABEL info.evolutics.buffet.versions-url='https://github.com/pinterest/ktlint/releases'
LABEL info.evolutics.buffet.version-example='0.39.0'

RUN apk add --no-cache \
    "openjdk11-jre-headless${_apk_openjdk11_jre_headless}" \
  && wget --directory-prefix /usr/local/bin \
    "https://github.com/pinterest/ktlint/releases/download/${ktlint}/ktlint" \
  && chmod +x /usr/local/bin/ktlint

WORKDIR /workdir

HEALTHCHECK CMD ktlint --version \
  && echo 'fun main () { println("Hi") }' | ktlint --format --stdin

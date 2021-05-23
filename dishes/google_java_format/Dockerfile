ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG _apk_openjdk11_jre_headless=''
ARG google_java_format

LABEL org.opencontainers.image.title='google-java-format'
LABEL org.opencontainers.image.url='https://github.com/google/google-java-format'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Java'
LABEL info.evolutics.buffet.versions-url='https://github.com/google/google-java-format/releases'
LABEL info.evolutics.buffet.version-example='1.9'

RUN apk add --no-cache \
    "openjdk11-jre-headless${_apk_openjdk11_jre_headless}" \
  && mkdir /opt/google-java-format \
  && wget --no-verbose \
    --output-document /opt/google-java-format/google-java-format.jar \
    "https://github.com/google/google-java-format/releases/download/google-java-format-${google_java_format}/google-java-format-${google_java_format}-all-deps.jar" \
  && printf '#!/bin/sh\n\njava -jar /opt/google-java-format/google-java-format.jar "$@"\n' \
    > /usr/local/bin/google-java-format \
  && chmod +x /usr/local/bin/google-java-format

WORKDIR /workdir

HEALTHCHECK CMD google-java-format --version \
  && echo 'class Foo { void bar() {} }' | google-java-format -

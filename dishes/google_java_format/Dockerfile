ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_curl='7.66.0'
ARG _apk_openjdk11_jre_headless='11.0.4'
ARG google_java_format

LABEL org.opencontainers.image.title='google-java-format'
LABEL org.opencontainers.image.url='https://github.com/google/google-java-format'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Java'
LABEL info.evolutics.buffet.versions-url='https://github.com/google/google-java-format/releases'

RUN apk add --no-cache \
    "curl~=${_apk_curl}" \
    "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}" \
  && mkdir /opt/google-java-format \
  && curl --fail --location --show-error --silent \
    "https://github.com/google/google-java-format/releases/download/google-java-format-${google_java_format}/google-java-format-${google_java_format}-all-deps.jar" \
    > /opt/google-java-format/google-java-format.jar \
  && printf '#!/bin/sh\n\njava -jar /opt/google-java-format/google-java-format.jar "$@"\n' \
    > /usr/local/bin/google-java-format \
  && chmod +x /usr/local/bin/google-java-format

WORKDIR /workdir

HEALTHCHECK CMD echo 'class Foo { void bar() {} }' | google-java-format -

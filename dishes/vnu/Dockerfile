ARG _alpine='3.11.3'

FROM alpine:"${_alpine}"
ARG _apk_openjdk11_jre_headless=''
ARG vnu

LABEL org.opencontainers.image.title='Nu Html Checker (v.Nu)'
LABEL org.opencontainers.image.url='https://validator.github.io/validator/'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='CSS,HTML,SVG'
LABEL info.evolutics.buffet.versions-url='https://github.com/validator/validator/releases'
LABEL info.evolutics.buffet.version-example='18.11.5'

RUN apk add --no-cache \
    "openjdk11-jre-headless${_apk_openjdk11_jre_headless}" \
  && vnu_archive="$(mktemp)" \
  && wget --output-document "${vnu_archive}" \
    "https://github.com/validator/validator/releases/download/${vnu}/vnu.jar_${vnu}.zip" \
  && mkdir /opt/vnu \
  && unzip -d /opt/vnu -j "${vnu_archive}" dist/vnu.jar \
  && rm "${vnu_archive}" \
  && printf '#!/bin/sh\n\njava -jar /opt/vnu/vnu.jar "$@"\n' \
    > /usr/local/bin/vnu \
  && chmod +x /usr/local/bin/vnu

WORKDIR /workdir

HEALTHCHECK CMD vnu --version \
  && echo '<!DOCTYPE html><title>Hi</title>' | vnu -

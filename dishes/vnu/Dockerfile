ARG _alpine='3.11.3'

FROM alpine:"${_alpine}"
ARG _apk_openjdk11_jre_headless=''
ARG _apk_yarn=''
ARG vnu

LABEL org.opencontainers.image.title='Nu Html Checker (v.Nu)'
LABEL org.opencontainers.image.url='https://validator.github.io/validator/'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='CSS,HTML,SVG'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/vnu-jar'
LABEL info.evolutics.buffet.version-example='20.3.16'

RUN apk add --no-cache \
    "openjdk11-jre-headless${_apk_openjdk11_jre_headless}" \
    "yarn${_apk_yarn}" \
  && yarn global add "vnu-jar@${vnu}" \
  && printf '#!/bin/sh\n\njava -jar %s "$@"\n' \
    '/usr/local/share/.config/yarn/global/node_modules/vnu-jar/build/dist/vnu.jar' \
    > /usr/local/bin/vnu \
  && chmod +x /usr/local/bin/vnu

WORKDIR /workdir

HEALTHCHECK CMD vnu --version \
  && echo '<!DOCTYPE html><title>Hi</title>' | vnu -

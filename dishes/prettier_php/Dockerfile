ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG _apk_git='2.22.0'
ARG _apk_yarn='1.16.0'
ARG _yarn_prettier='1.19.1'
ARG prettier_php

LABEL org.opencontainers.image.title='Prettier PHP Plugin'
LABEL org.opencontainers.image.url='https://github.com/prettier/plugin-php'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='PHP'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/@prettier/plugin-php'
LABEL info.evolutics.buffet.version-example='0.11.2'

RUN apk add --no-cache \
    "git~=${_apk_git}" \
    "yarn~=${_apk_yarn}" \
  && yarn global add \
    "@prettier/plugin-php@${prettier_php}" \
    "prettier@${_yarn_prettier}"

WORKDIR /workdir

HEALTHCHECK CMD echo '<?php echo "Hi" ; ?>' | prettier --stdin-filepath main.php

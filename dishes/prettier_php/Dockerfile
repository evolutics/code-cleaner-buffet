ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG _apk_git=''
ARG _apk_yarn=''
ARG _yarn_prettier='2.3.0'
ARG prettier_php

LABEL org.opencontainers.image.title='Prettier PHP Plugin'
LABEL org.opencontainers.image.url='https://github.com/prettier/plugin-php'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='PHP'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/@prettier/plugin-php'
LABEL info.evolutics.buffet.version-example='0.15.1'

RUN apk add --no-cache \
    "git${_apk_git}" \
    "yarn${_apk_yarn}" \
  && yarn global add \
    "@prettier/plugin-php@${prettier_php}" \
    "prettier@${_yarn_prettier}"

WORKDIR /workdir

HEALTHCHECK CMD prettier --version \
  && echo '<?php echo "Hi" ; ?>' | prettier --stdin-filepath main.php

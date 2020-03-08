ARG _alpine='3.11.3'

FROM alpine:"${_alpine}"
ARG _apk_composer=''
ARG phplint

LABEL org.opencontainers.image.title='phplint'
LABEL org.opencontainers.image.url='https://github.com/overtrue/phplint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='PHP'
LABEL info.evolutics.buffet.versions-url='https://packagist.org/packages/overtrue/phplint'
LABEL info.evolutics.buffet.version-example='1.2.1'

RUN apk add --no-cache "composer${_apk_composer}" \
  && composer global require "overtrue/phplint:${phplint}" \
  && ln -s "${HOME}/.composer/vendor/bin/phplint" /usr/local/bin/phplint

WORKDIR /workdir

HEALTHCHECK CMD phplint --version \
  && echo '<?php echo "Hi"; ?>' > main.php \
  && phplint main.php

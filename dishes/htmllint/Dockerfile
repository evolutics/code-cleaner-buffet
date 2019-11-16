ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG htmllint

LABEL org.opencontainers.image.title='htmllint-cli'
LABEL org.opencontainers.image.url='https://github.com/htmllint/htmllint-cli'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='HTML'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/htmllint-cli'
LABEL info.evolutics.buffet.version-example='0.0.7'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add "htmllint-cli@${htmllint}"

WORKDIR /workdir

HEALTHCHECK CMD htmllint init \
  && echo \
    '<!DOCTYPE html><html><head><meta charset="utf-8"><title>Hi</title></head></html>' \
    > main.html \
  && htmllint

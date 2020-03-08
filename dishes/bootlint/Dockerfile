ARG _alpine='3.11.3'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG bootlint

LABEL org.opencontainers.image.title='Bootlint'
LABEL org.opencontainers.image.url='https://github.com/twbs/bootlint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='HTML'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/bootlint'
LABEL info.evolutics.buffet.version-example='1.0.0'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add "bootlint@${bootlint}"

WORKDIR /workdir

HEALTHCHECK CMD bootlint --version \
  && echo \
    '<!DOCTYPE html><html><head><meta charset="utf-8"><title>Hi</title></head></html>' \
    | bootlint --disable W002,W003,W005

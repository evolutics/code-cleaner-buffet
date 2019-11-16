ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG bootlint

LABEL org.opencontainers.image.title='Bootlint'
LABEL org.opencontainers.image.url='https://github.com/twbs/bootlint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='HTML'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/bootlint'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add "bootlint@${bootlint}"

WORKDIR /workdir

HEALTHCHECK CMD echo \
    '<!DOCTYPE html><html><head><meta charset="utf-8"><title>Hi</title></head></html>' \
    | bootlint --disable W002,W003,W005

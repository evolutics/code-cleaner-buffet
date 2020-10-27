ARG _alpine='3.12.0'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG htmlhint

LABEL org.opencontainers.image.title='HTMLHint'
LABEL org.opencontainers.image.url='https://htmlhint.com'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='HTML'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/htmlhint'
LABEL info.evolutics.buffet.version-example='0.14.1'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add "htmlhint@${htmlhint}"

WORKDIR /workdir

HEALTHCHECK CMD htmlhint --version \
  && echo \
    '<!DOCTYPE html><html><head><meta charset="utf-8"><title>Hi</title></head></html>' \
    > index.html \
  && htmlhint index.html

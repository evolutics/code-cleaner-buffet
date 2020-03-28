ARG _alpine='3.11.5'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG jsonlint

LABEL org.opencontainers.image.title='JSON Lint'
LABEL org.opencontainers.image.url='https://github.com/zaach/jsonlint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='JSON'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/jsonlint'
LABEL info.evolutics.buffet.version-example='1.6.3'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add "jsonlint@${jsonlint}"

WORKDIR /workdir

HEALTHCHECK CMD jsonlint --version ; [ "$?" -eq 1 ] \
  && echo '{"foo": "bar"}' | jsonlint

ARG _alpine='3.12.0'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG commitlint

LABEL org.opencontainers.image.title='commitlint'
LABEL org.opencontainers.image.url='https://commitlint.js.org'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages=''
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/@commitlint/cli'
LABEL info.evolutics.buffet.version-example='11.0.0'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add "@commitlint/cli@${commitlint}"

WORKDIR /workdir

HEALTHCHECK CMD commitlint --version \
  && echo \
    'module.exports = { rules: { "header-max-length": [2, "always", 72] } };' \
    > commitlint.config.js \
  && echo 'Foo bar' | commitlint

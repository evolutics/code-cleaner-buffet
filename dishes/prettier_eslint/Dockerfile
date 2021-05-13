ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG prettier_eslint

LABEL org.opencontainers.image.title='prettier-eslint'
LABEL org.opencontainers.image.url='https://github.com/prettier/prettier-eslint-cli'
LABEL info.evolutics.buffet.categories='Formatter,Linter'
LABEL info.evolutics.buffet.languages='JavaScript'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/prettier-eslint-cli'
LABEL info.evolutics.buffet.version-example='5.0.0'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add "prettier-eslint-cli@${prettier_eslint}"

WORKDIR /workdir

HEALTHCHECK CMD prettier-eslint --version \
  && echo 'var foo = "bar" ' | prettier-eslint --stdin --stdin-filepath baz.js

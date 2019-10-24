ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG prettier_eslint

LABEL org.opencontainers.image.title='prettier-eslint'
LABEL org.opencontainers.image.url='https://github.com/prettier/prettier-eslint-cli'
LABEL info.evolutics.buffet.categories='Formatter,Linter'
LABEL info.evolutics.buffet.languages='JavaScript'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/prettier-eslint-cli#changelog'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add "prettier-eslint-cli@${prettier_eslint}"

WORKDIR /workdir

HEALTHCHECK CMD echo 'var  foo =  "bar"' \
  | prettier-eslint --stdin --stdin-filepath baz.js

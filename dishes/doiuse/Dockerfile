ARG _alpine='3.11.5'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG doiuse

LABEL org.opencontainers.image.title='doiuse'
LABEL org.opencontainers.image.url='https://github.com/anandthakker/doiuse'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='CSS'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/doiuse'
LABEL info.evolutics.buffet.version-example='4.2.0'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add "doiuse@${doiuse}"

WORKDIR /workdir

HEALTHCHECK CMD doiuse --version \
  && echo '.a { display: none; }' \
    | doiuse --browsers 'ie >= 9, > 1%, last 2 versions'

ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG doiuse

LABEL org.opencontainers.image.title='doiuse'
LABEL org.opencontainers.image.url='https://github.com/anandthakker/doiuse'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='CSS'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/doiuse'
LABEL info.evolutics.buffet.version-example='4.2.0'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add "doiuse@${doiuse}"

WORKDIR /workdir

HEALTHCHECK CMD echo '.a { display: none; }' \
    | doiuse --browsers 'ie >= 9, > 1%, last 2 versions'

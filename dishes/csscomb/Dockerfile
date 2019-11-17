ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG csscomb

LABEL org.opencontainers.image.title='CSScomb'
LABEL org.opencontainers.image.url='https://github.com/csscomb/csscomb.js'
LABEL info.evolutics.buffet.categories='Formatter,Linter'
LABEL info.evolutics.buffet.languages='CSS'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/csscomb'
LABEL info.evolutics.buffet.version-example='4.3.0'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add "csscomb@${csscomb}"

WORKDIR /workdir

HEALTHCHECK CMD echo '.a { display: none; }' | csscomb -

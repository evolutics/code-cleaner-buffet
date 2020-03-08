ARG _alpine='3.11.3'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG xo

LABEL org.opencontainers.image.title='XO'
LABEL org.opencontainers.image.url='https://github.com/xojs/xo'
LABEL info.evolutics.buffet.categories='Formatter,Linter'
LABEL info.evolutics.buffet.languages='JavaScript,JSX'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/xo'
LABEL info.evolutics.buffet.version-example='0.24.0'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add "xo@${xo}"

WORKDIR /workdir

HEALTHCHECK CMD xo --version \
  && echo 'const x=true' | xo --fix --stdin

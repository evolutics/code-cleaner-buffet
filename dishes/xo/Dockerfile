ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG xo

LABEL org.opencontainers.image.title='XO'
LABEL org.opencontainers.image.url='https://github.com/xojs/xo'
LABEL info.evolutics.buffet.categories='Formatter,Linter'
LABEL info.evolutics.buffet.languages='JavaScript,JSX'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/xo'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add "xo@${xo}"

WORKDIR /workdir

HEALTHCHECK CMD echo 'const x=true' | xo --fix --stdin

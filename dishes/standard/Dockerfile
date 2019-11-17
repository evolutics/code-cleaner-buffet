ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG standard

LABEL org.opencontainers.image.title='JavaScript Standard Style'
LABEL org.opencontainers.image.url='https://standardjs.com'
LABEL info.evolutics.buffet.categories='Formatter,Linter'
LABEL info.evolutics.buffet.languages='JavaScript'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/standard'
LABEL info.evolutics.buffet.version-example='14.3.1'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add "standard@${standard}"

WORKDIR /workdir

HEALTHCHECK CMD \
  echo 'var foo =  "bar"; console.log(foo)' | standard --fix --stdin

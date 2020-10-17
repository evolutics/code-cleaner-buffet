ARG _alpine='3.12.0'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG standard

LABEL org.opencontainers.image.title='JavaScript Standard Style'
LABEL org.opencontainers.image.url='https://standardjs.com'
LABEL info.evolutics.buffet.categories='Formatter,Linter'
LABEL info.evolutics.buffet.languages='JavaScript'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/standard'
LABEL info.evolutics.buffet.version-example='14.3.4'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add "standard@${standard}"

WORKDIR /workdir

HEALTHCHECK CMD standard --version \
  && echo 'var foo = "bar" ; console.log(foo)' | standard --fix --stdin

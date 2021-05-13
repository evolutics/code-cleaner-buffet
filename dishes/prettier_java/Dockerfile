ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG _yarn_prettier='2.3.0'
ARG prettier_java

LABEL org.opencontainers.image.title='Prettier Java Plugin'
LABEL org.opencontainers.image.url='https://github.com/jhipster/prettier-java'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Java'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/prettier-plugin-java'
LABEL info.evolutics.buffet.version-example='0.8.3'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add \
    "prettier-plugin-java@${prettier_java}" \
    "prettier@${_yarn_prettier}"

WORKDIR /workdir

HEALTHCHECK CMD prettier --version \
  && echo 'class Foo { void bar() {} }' | prettier --stdin-filepath Foo.java

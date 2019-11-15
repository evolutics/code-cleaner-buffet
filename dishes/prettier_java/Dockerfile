ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG _yarn_prettier='1.19.1'
ARG prettier_java

LABEL org.opencontainers.image.title='Prettier Java Plugin'
LABEL org.opencontainers.image.url='https://github.com/jhipster/prettier-java'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Java'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/prettier-plugin-java'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add \
    "prettier-plugin-java@${prettier_java}" \
    "prettier@${_yarn_prettier}"

WORKDIR /workdir

HEALTHCHECK CMD \
  echo 'class Foo { void bar() {} }' | prettier --stdin-filepath Foo.java

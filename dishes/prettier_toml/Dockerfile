ARG _alpine='3.12.0'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG _yarn_prettier='2.1.2'
ARG prettier_toml

LABEL org.opencontainers.image.title='Prettier Toml Plugin'
LABEL org.opencontainers.image.url='https://github.com/bd82/toml-tools/tree/master/packages/prettier-plugin-toml'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='TOML'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/prettier-plugin-toml'
LABEL info.evolutics.buffet.version-example='0.3.1'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add \
    "prettier-plugin-toml@${prettier_toml}" \
    "prettier@${_yarn_prettier}"

WORKDIR /workdir

HEALTHCHECK CMD prettier --version \
  && echo 'foo = "bar" ' | prettier --stdin-filepath main.toml

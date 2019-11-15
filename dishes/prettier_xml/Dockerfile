ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG _yarn_prettier='1.19.1'
ARG prettier_xml

LABEL org.opencontainers.image.title='Prettier XML plugin'
LABEL org.opencontainers.image.url='https://github.com/prettier/plugin-xml'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='XML'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/@prettier/plugin-xml#changelog'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add \
    "@prettier/plugin-xml@${prettier_xml}" \
    "prettier@${_yarn_prettier}"

WORKDIR /workdir

HEALTHCHECK CMD echo '<?xml version="1.0"?><message>Hi</message>' \
    | prettier --stdin-filepath main.xml

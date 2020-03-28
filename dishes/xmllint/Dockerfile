ARG _alpine='3.11.5'

FROM alpine:"${_alpine}"
ARG xmllint

LABEL org.opencontainers.image.title='xmllint'
LABEL org.opencontainers.image.url='http://xmlsoft.org/xmllint.html'
LABEL info.evolutics.buffet.categories='Formatter,Linter'
LABEL info.evolutics.buffet.languages='XML'
LABEL info.evolutics.buffet.versions-url='https://pkgs.alpinelinux.org/packages?name=libxml2-utils&branch=v3.11'
LABEL info.evolutics.buffet.version-example='2.9.10'

RUN apk add --no-cache "libxml2-utils~=${xmllint}"

WORKDIR /workdir

HEALTHCHECK CMD xmllint --version \
  && echo '<?xml version="1.0"?><message>Hi</message>' | xmllint -

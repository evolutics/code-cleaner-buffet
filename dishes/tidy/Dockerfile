ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG tidy

LABEL org.opencontainers.image.title='HTML Tidy'
LABEL org.opencontainers.image.url='http://www.html-tidy.org'
LABEL info.evolutics.buffet.categories='Formatter,Linter'
LABEL info.evolutics.buffet.languages='HTML,XML'
LABEL info.evolutics.buffet.versions-url='https://pkgs.alpinelinux.org/packages?name=tidyhtml&branch=v3.10'
LABEL info.evolutics.buffet.version-example='5.6.0'

RUN apk add --no-cache "tidyhtml~=${tidy}"

WORKDIR /workdir

HEALTHCHECK CMD echo '<!DOCTYPE html><title>Hi</title>' | tidy

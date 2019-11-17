ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG _apk_aspell_en='2018.04.16'
ARG aspell

LABEL org.opencontainers.image.title='GNU Aspell'
LABEL org.opencontainers.image.url='http://aspell.net'
LABEL info.evolutics.buffet.categories='Spell checker'
LABEL info.evolutics.buffet.languages='Natural language'
LABEL info.evolutics.buffet.versions-url='https://pkgs.alpinelinux.org/packages?name=aspell&branch=v3.10'
LABEL info.evolutics.buffet.version-example='0.60.6.1'

RUN apk add --no-cache \
    "aspell~=${aspell}" \
    "aspell-en~=${_apk_aspell_en}"

WORKDIR /workdir

HEALTHCHECK CMD aspell --version \
  && echo 'example' | aspell --lang en_US list

ARG _alpine='3.11.5'

FROM alpine:"${_alpine}"
ARG _apk_aspell_en=''
ARG aspell

LABEL org.opencontainers.image.title='GNU Aspell'
LABEL org.opencontainers.image.url='http://aspell.net'
LABEL info.evolutics.buffet.categories='Spell checker'
LABEL info.evolutics.buffet.languages='Natural language'
LABEL info.evolutics.buffet.versions-url='https://pkgs.alpinelinux.org/packages?name=aspell&branch=v3.11'
LABEL info.evolutics.buffet.version-example='0.60.8'

RUN apk add --no-cache \
    "aspell~=${aspell}" \
    "aspell-en${_apk_aspell_en}"

WORKDIR /workdir

HEALTHCHECK CMD aspell --version \
  && echo 'example' | aspell --lang en_US list

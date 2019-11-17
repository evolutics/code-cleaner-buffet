ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG _apk_hunspell_en='2018.04.16'
ARG hunspell

LABEL org.opencontainers.image.title='Hunspell'
LABEL org.opencontainers.image.url='https://hunspell.github.io'
LABEL info.evolutics.buffet.categories='Spell checker'
LABEL info.evolutics.buffet.languages='Natural language'
LABEL info.evolutics.buffet.versions-url='https://pkgs.alpinelinux.org/packages?name=hunspell&branch=v3.10'
LABEL info.evolutics.buffet.version-example='1.7.0'

RUN apk add --no-cache \
    "hunspell~=${hunspell}" \
    "hunspell-en~=${_apk_hunspell_en}"

WORKDIR /workdir

HEALTHCHECK CMD echo 'example' | hunspell -d en_US

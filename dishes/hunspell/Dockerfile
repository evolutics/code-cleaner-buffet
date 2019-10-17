ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG hunspell
ARG hunspell_hunspell_en='2018.04.16'

LABEL org.opencontainers.image.title='Hunspell'
LABEL org.opencontainers.image.url='https://hunspell.github.io'
LABEL info.evolutics.buffet.categories='Spell checker'
LABEL info.evolutics.buffet.languages=''
LABEL info.evolutics.buffet.versions-url='https://pkgs.alpinelinux.org/packages?name=hunspell&branch=v3.10'

RUN apk add --no-cache \
    "hunspell~=${hunspell}" \
    "hunspell-en~=${hunspell_hunspell_en}"

WORKDIR /workdir

HEALTHCHECK CMD echo 'example' | hunspell -d en_US

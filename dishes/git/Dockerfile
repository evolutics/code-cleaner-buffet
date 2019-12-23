ARG _alpine='3.11.0'

FROM alpine:"${_alpine}"
ARG git

LABEL org.opencontainers.image.title='Git'
LABEL org.opencontainers.image.url='https://git-scm.com'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages=''
LABEL info.evolutics.buffet.versions-url='https://pkgs.alpinelinux.org/packages?name=git&branch=v3.11'
LABEL info.evolutics.buffet.version-example='2.24.1'

RUN apk add --no-cache "git~=${git}"

WORKDIR /workdir

HEALTHCHECK CMD git --version \
  && git init \
  && git config user.email me@example.com \
  && touch readme \
  && git add . \
  && git commit -m 'Start readme'

ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG gitlint
ARG gitlint_git='2.22.0-r0'
ARG gitlint_python3='3.7.5-r0'

LABEL org.opencontainers.image.title='Gitlint'
LABEL org.opencontainers.image.url='http://jorisroovers.github.io/gitlint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages=''
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/gitlint/#history'

RUN apk add --no-cache \
    "git==${gitlint_git}" \
    "python3==${gitlint_python3}" \
  && pip3 install "gitlint==${gitlint}"

WORKDIR /workdir

HEALTHCHECK CMD printf 'Change foo\n\nBecause bar is missing.\n' | gitlint

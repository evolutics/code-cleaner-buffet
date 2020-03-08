ARG _alpine='3.11.3'

FROM alpine:"${_alpine}"
ARG _apk_git=''
ARG _apk_python3=''
ARG gitlint

LABEL org.opencontainers.image.title='Gitlint'
LABEL org.opencontainers.image.url='http://jorisroovers.github.io/gitlint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages=''
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/gitlint/'
LABEL info.evolutics.buffet.version-example='0.12.0'

RUN apk add --no-cache \
    "git${_apk_git}" \
    "python3${_apk_python3}" \
  && pip3 install "gitlint==${gitlint}"

WORKDIR /workdir

HEALTHCHECK CMD gitlint --version \
  && printf 'Change foo\n\nBecause bar is missing.\n' | gitlint

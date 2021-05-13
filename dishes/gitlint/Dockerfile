ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG _apk_git=''
ARG _apk_py3_pip=''
ARG gitlint

LABEL org.opencontainers.image.title='Gitlint'
LABEL org.opencontainers.image.url='http://jorisroovers.github.io/gitlint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages=''
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/gitlint/'
LABEL info.evolutics.buffet.version-example='0.15.1'

RUN apk add --no-cache \
    "git${_apk_git}" \
    "py3-pip${_apk_py3_pip}" \
  && pip install "gitlint==${gitlint}"

WORKDIR /workdir

HEALTHCHECK CMD gitlint --version \
  && printf 'Change foo\n\nBecause bar is missing.\n' | gitlint

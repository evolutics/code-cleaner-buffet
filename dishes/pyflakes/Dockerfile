ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG _apk_python3='3.7.5'
ARG pyflakes

LABEL org.opencontainers.image.title='Pyflakes'
LABEL org.opencontainers.image.url='https://github.com/PyCQA/pyflakes'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/pyflakes/'
LABEL info.evolutics.buffet.version-example='2.1.1'

RUN apk add --no-cache "python3~=${_apk_python3}" \
  && pip3 install "pyflakes==${pyflakes}"

WORKDIR /workdir

HEALTHCHECK CMD echo 'one = 1' | pyflakes

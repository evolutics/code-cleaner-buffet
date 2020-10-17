ARG _alpine='3.12.0'

FROM alpine:"${_alpine}"
ARG _apk_py3_pip=''
ARG pyflakes

LABEL org.opencontainers.image.title='Pyflakes'
LABEL org.opencontainers.image.url='https://github.com/PyCQA/pyflakes'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/pyflakes/'
LABEL info.evolutics.buffet.version-example='2.2.0'

RUN apk add --no-cache "py3-pip${_apk_py3_pip}" \
  && pip install "pyflakes==${pyflakes}"

WORKDIR /workdir

HEALTHCHECK CMD pyflakes --version \
  && echo 'one = 1' | pyflakes

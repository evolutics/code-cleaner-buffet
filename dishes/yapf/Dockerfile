ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG _apk_py3_pip=''
ARG yapf

LABEL org.opencontainers.image.title='YAPF'
LABEL org.opencontainers.image.url='https://github.com/google/yapf'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/yapf/'
LABEL info.evolutics.buffet.version-example='0.30.0'

RUN apk add --no-cache "py3-pip${_apk_py3_pip}" \
  && pip install --no-cache-dir "yapf==${yapf}"

WORKDIR /workdir

HEALTHCHECK CMD yapf --version \
  && echo 'y = "hello ""world"' | yapf

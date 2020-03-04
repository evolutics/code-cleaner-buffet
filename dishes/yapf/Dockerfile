ARG _alpine='3.11.0'

FROM alpine:"${_alpine}"
ARG _apk_python3=''
ARG yapf

LABEL org.opencontainers.image.title='YAPF'
LABEL org.opencontainers.image.url='https://github.com/google/yapf'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/yapf/'
LABEL info.evolutics.buffet.version-example='0.29.0'

RUN apk add --no-cache "python3${_apk_python3}" \
  && pip3 install "yapf==${yapf}"

WORKDIR /workdir

HEALTHCHECK CMD yapf --version \
  && echo 'y = "hello ""world"' | yapf

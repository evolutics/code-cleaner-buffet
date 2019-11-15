ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_python3='3.7.5'
ARG yapf

LABEL org.opencontainers.image.title='YAPF'
LABEL org.opencontainers.image.url='https://github.com/google/yapf'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/yapf/'

RUN apk add --no-cache "python3~=${_apk_python3}" \
  && pip3 install "yapf==${yapf}"

WORKDIR /workdir

HEALTHCHECK CMD echo 'y = "hello ""world"' | yapf

ARG _alpine='3.11.5'

FROM alpine:"${_alpine}"
ARG _apk_gcc=''
ARG _apk_musl_dev=''
ARG _apk_python3_dev=''
ARG pylint

LABEL org.opencontainers.image.title='Pylint'
LABEL org.opencontainers.image.url='https://www.pylint.org'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/pylint/'
LABEL info.evolutics.buffet.version-example='2.4.4'

RUN apk add --no-cache \
    "gcc${_apk_gcc}" \
    "musl-dev${_apk_musl_dev}" \
    "python3-dev${_apk_python3_dev}" \
  && pip3 install "pylint==${pylint}"

WORKDIR /workdir

HEALTHCHECK CMD pylint --version \
  && echo 'ONE = 1' > main.py \
  && pylint --disable missing-module-docstring main.py

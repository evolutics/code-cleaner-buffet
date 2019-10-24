ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_gcc='8.3.0'
ARG _apk_musl_dev='1.1.22'
ARG _apk_python3_dev='3.7.5'
ARG pylint

LABEL org.opencontainers.image.title='Pylint'
LABEL org.opencontainers.image.url='https://www.pylint.org'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/pylint/#history'

RUN apk add --no-cache \
    "gcc~=${_apk_gcc}" \
    "musl-dev~=${_apk_musl_dev}" \
    "python3-dev~=${_apk_python3_dev}" \
  && pip3 install "pylint==${pylint}"

WORKDIR /workdir

HEALTHCHECK CMD echo 'ONE = 1' > main.py \
  && pylint --disable missing-module-docstring main.py

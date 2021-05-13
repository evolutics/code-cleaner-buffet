ARG _alpine='3.13.5'

FROM alpine:"${_alpine}" AS pylint
ARG _apk_gcc=''
ARG _apk_musl_dev=''
ARG _apk_py3_pip=''
ARG _apk_python3_dev=''
ARG pylint
RUN apk add --no-cache \
    "gcc${_apk_gcc}" \
    "musl-dev${_apk_musl_dev}" \
    "py3-pip${_apk_py3_pip}" \
    "python3-dev${_apk_python3_dev}" \
  && pip install --target /opt/pylint "pylint==${pylint}"

FROM alpine:"${_alpine}"
ARG _apk_py3_pip=''

LABEL org.opencontainers.image.title='Pylint'
LABEL org.opencontainers.image.url='https://www.pylint.org'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/pylint/'
LABEL info.evolutics.buffet.version-example='2.8.2'

RUN apk add --no-cache "py3-pip${_apk_py3_pip}"
COPY --from=pylint /opt/pylint /opt/pylint
ENV PATH="${PATH}:/opt/pylint/bin" \
  PYTHONPATH="${PYTHONPATH}:/opt/pylint"

WORKDIR /workdir

HEALTHCHECK CMD pylint --version \
  && echo 'ONE = 1' > main.py \
  && pylint --disable missing-module-docstring main.py

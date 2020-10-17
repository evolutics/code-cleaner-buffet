ARG _alpine='3.12.0'

FROM alpine:"${_alpine}"
ARG _apk_py3_pip=''
ARG yamllint

LABEL org.opencontainers.image.title='yamllint'
LABEL org.opencontainers.image.url='https://yamllint.readthedocs.io'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='YAML'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/yamllint/'
LABEL info.evolutics.buffet.version-example='1.25.0'

RUN apk add --no-cache "py3-pip${_apk_py3_pip}" \
  && pip install "yamllint==${yamllint}"

WORKDIR /workdir

HEALTHCHECK CMD yamllint --version \
  && echo 'foo: bar' | yamllint -

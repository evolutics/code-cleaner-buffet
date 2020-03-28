ARG _alpine='3.11.5'

FROM alpine:"${_alpine}"
ARG _apk_python3=''
ARG yamllint

LABEL org.opencontainers.image.title='yamllint'
LABEL org.opencontainers.image.url='https://yamllint.readthedocs.io'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='YAML'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/yamllint/'
LABEL info.evolutics.buffet.version-example='1.21.0'

RUN apk add --no-cache "python3${_apk_python3}" \
  && pip3 install "yamllint==${yamllint}"

WORKDIR /workdir

HEALTHCHECK CMD yamllint --version \
  && echo 'foo: bar' | yamllint -

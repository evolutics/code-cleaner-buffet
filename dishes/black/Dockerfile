ARG _alpine='3.13.5'

FROM alpine:"${_alpine}" AS black
ARG _apk_gcc=''
ARG _apk_musl_dev=''
ARG _apk_py3_pip=''
ARG _apk_python3_dev=''
ARG black
RUN apk add --no-cache \
    "gcc${_apk_gcc}" \
    "musl-dev${_apk_musl_dev}" \
    "py3-pip${_apk_py3_pip}" \
    "python3-dev${_apk_python3_dev}" \
  && pip install --target /opt/black "black==${black}"

FROM alpine:"${_alpine}"
ARG _apk_python3=''

LABEL org.opencontainers.image.title='Black'
LABEL org.opencontainers.image.url='https://github.com/psf/black'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/black/'
LABEL info.evolutics.buffet.version-example='21.5b1'

RUN apk add --no-cache "python3${_apk_python3}"
COPY --from=black /opt/black /opt/black
ENV PATH="${PATH}:/opt/black/bin" \
  PYTHONPATH="${PYTHONPATH}:/opt/black"

WORKDIR /workdir

HEALTHCHECK CMD black --version \
  && echo 'j = [1, 2,3 ]' | black -

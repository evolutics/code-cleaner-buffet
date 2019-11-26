ARG _alpine='3.10.3'

FROM alpine:"${_alpine}" AS black
ARG _apk_gcc='8.3.0'
ARG _apk_musl_dev='1.1.22'
ARG _apk_python3_dev='3.7.5'
ARG black
# hadolint ignore=DL3013
RUN apk add --no-cache \
    "gcc~=${_apk_gcc}" \
    "musl-dev~=${_apk_musl_dev}" \
    "python3-dev~=${_apk_python3_dev}" \
  && pip3 install --target /opt/black "black==${black}"

FROM alpine:"${_alpine}"
ARG _apk_python3='3.7.5'

LABEL org.opencontainers.image.title='Black'
LABEL org.opencontainers.image.url='https://github.com/psf/black'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/black/'
LABEL info.evolutics.buffet.version-example='19.10b0'

RUN apk add --no-cache "python3~=${_apk_python3}"
COPY --from=black /opt/black /opt/black
ENV PATH="${PATH}:/opt/black/bin" \
  PYTHONPATH="${PYTHONPATH}:/opt/black"

WORKDIR /workdir

HEALTHCHECK CMD black --version \
  && echo 'j = [1,  2,3]' | black -

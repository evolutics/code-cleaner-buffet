ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_python3='3.7.5'
ARG black

LABEL org.opencontainers.image.title='Black'
LABEL org.opencontainers.image.url='https://github.com/psf/black'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/black/'

RUN apk add --no-cache "python3~=${_apk_python3}" \
  && pip3 install "black==${black}"

WORKDIR /workdir

HEALTHCHECK CMD echo 'j = [1,  2,3]' | black -

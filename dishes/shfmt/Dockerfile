ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG shfmt

LABEL org.opencontainers.image.title='shfmt'
LABEL org.opencontainers.image.url='https://github.com/mvdan/sh'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Shell'
LABEL info.evolutics.buffet.versions-url='https://github.com/mvdan/sh/releases'
LABEL info.evolutics.buffet.version-example='3.2.4'

RUN wget --no-verbose --output-document /usr/local/bin/shfmt \
    "https://github.com/mvdan/sh/releases/download/v${shfmt}/shfmt_v${shfmt}_linux_386" \
  && chmod +x /usr/local/bin/shfmt

WORKDIR /workdir

HEALTHCHECK CMD shfmt -version \
  && echo 'echo  "Hi"' | shfmt

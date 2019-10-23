ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_cabal='2.4.1.0'
ARG _apk_ghc='8.4.3'
ARG _apk_gmp='6.1.2'
ARG _apk_libffi='3.2.1'
ARG _apk_musl_dev='1.1.22'
ARG _apk_ncurses_dev='6.1_p20190518'
ARG _apk_wget='1.20.3'
ARG brittany

LABEL org.opencontainers.image.title='brittany'
LABEL org.opencontainers.image.url='https://github.com/lspitzner/brittany'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Haskell'
LABEL info.evolutics.buffet.versions-url='https://hackage.haskell.org/package/brittany'

RUN apk add --no-cache \
    "cabal~=${_apk_cabal}" \
    "ghc~=${_apk_ghc}" \
    "gmp~=${_apk_gmp}" \
    "libffi~=${_apk_libffi}" \
    "musl-dev~=${_apk_musl_dev}" \
    "ncurses-dev~=${_apk_ncurses_dev}" \
    "wget~=${_apk_wget}" \
  \
  && cabal v2-update \
  && cabal v2-install --jobs "brittany-${brittany}" \
  && ln -s "${HOME}/.cabal/bin/brittany" /usr/local/bin/brittany

WORKDIR /workdir

HEALTHCHECK CMD echo 'example = case x of Just p -> foo bar' | brittany

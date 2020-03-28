ARG _alpine='3.11.5'

FROM alpine:"${_alpine}"
ARG _apk_cabal=''
ARG _apk_ghc=''
ARG _apk_gmp=''
ARG _apk_libffi=''
ARG _apk_musl_dev=''
ARG _apk_ncurses_dev=''
ARG _apk_wget=''
ARG brittany

LABEL org.opencontainers.image.title='brittany'
LABEL org.opencontainers.image.url='https://github.com/lspitzner/brittany'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Haskell'
LABEL info.evolutics.buffet.versions-url='https://hackage.haskell.org/package/brittany'
LABEL info.evolutics.buffet.version-example='0.12.1.1'

RUN apk add --no-cache \
    "cabal${_apk_cabal}" \
    "ghc${_apk_ghc}" \
    "gmp${_apk_gmp}" \
    "libffi${_apk_libffi}" \
    "musl-dev${_apk_musl_dev}" \
    "ncurses-dev${_apk_ncurses_dev}" \
    "wget${_apk_wget}" \
  \
  && cabal v2-update \
  && cabal v2-install --jobs "brittany-${brittany}" \
  && ln -s "${HOME}/.cabal/bin/brittany" /usr/local/bin/brittany

WORKDIR /workdir

HEALTHCHECK CMD brittany --version \
  && echo 'example = case x of Just p -> foo bar' | brittany

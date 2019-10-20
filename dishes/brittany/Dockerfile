ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG brittany
ARG brittany_cabal='2.4.1.0'
ARG brittany_ghc='8.4.3'
ARG brittany_gmp='6.1.2'
ARG brittany_libffi='3.2.1'
ARG brittany_musl_dev='1.1.22'
ARG brittany_ncurses_dev='6.1_p20190518'
ARG brittany_wget='1.20.3'

LABEL org.opencontainers.image.title='brittany'
LABEL org.opencontainers.image.url='https://github.com/lspitzner/brittany'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Haskell'
LABEL info.evolutics.buffet.versions-url='https://hackage.haskell.org/package/brittany'

RUN apk add --no-cache \
    "cabal~=${brittany_cabal}" \
    "ghc~=${brittany_ghc}" \
    "gmp~=${brittany_gmp}" \
    "libffi~=${brittany_libffi}" \
    "musl-dev~=${brittany_musl_dev}" \
    "ncurses-dev~=${brittany_ncurses_dev}" \
    "wget~=${brittany_wget}" \
  \
  && cabal v2-update \
  && cabal v2-install --jobs "brittany-${brittany}" \
  && ln -s "${HOME}/.cabal/bin/brittany" /usr/local/bin/brittany

WORKDIR /workdir

HEALTHCHECK CMD echo 'example = case x of Just p -> foo bar' | brittany

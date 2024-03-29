ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG _apk_cabal=''
ARG _apk_ghc=''
ARG _apk_gmp=''
ARG _apk_libffi=''
ARG _apk_musl_dev=''
ARG _apk_ncurses_dev=''
ARG _apk_wget=''
ARG hlint

LABEL org.opencontainers.image.title='HLint'
LABEL org.opencontainers.image.url='https://github.com/ndmitchell/hlint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Haskell'
LABEL info.evolutics.buffet.versions-url='https://hackage.haskell.org/package/hlint'
LABEL info.evolutics.buffet.version-example='3.2.1'

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
  && cabal v2-install --jobs alex happy \
  && cabal v2-install --jobs "hlint-${hlint}" \
  && ln -s "${HOME}/.cabal/bin/hlint" /usr/local/bin/hlint

WORKDIR /workdir

HEALTHCHECK CMD hlint --version \
  && echo 'foo = fmap . fmap' | hlint -

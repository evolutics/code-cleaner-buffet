ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG _apk_cabal='2.4.1.0'
ARG _apk_ghc='8.4.3'
ARG _apk_gmp='6.1.2'
ARG _apk_libffi='3.2.1'
ARG _apk_musl_dev='1.1.22'
ARG _apk_ncurses_dev='6.1_p20190518'
ARG _apk_wget='1.20.3'
ARG hlint

LABEL org.opencontainers.image.title='HLint'
LABEL org.opencontainers.image.url='https://github.com/ndmitchell/hlint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Haskell'
LABEL info.evolutics.buffet.versions-url='https://hackage.haskell.org/package/hlint'
LABEL info.evolutics.buffet.version-example='2.2.3'

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
  && cabal v2-install --jobs alex happy \
  && cabal v2-install --jobs "hlint-${hlint}" \
  && ln -s "${HOME}/.cabal/bin/hlint" /usr/local/bin/hlint

WORKDIR /workdir

HEALTHCHECK CMD echo 'foo = fmap . fmap' | hlint -

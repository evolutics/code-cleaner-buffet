ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG hlint
ARG hlint_cabal='2.4.1.0'
ARG hlint_ghc='8.4.3'
ARG hlint_gmp='6.1.2'
ARG hlint_libffi='3.2.1'
ARG hlint_musl_dev='1.1.22'
ARG hlint_ncurses_dev='6.1_p20190518'
ARG hlint_wget='1.20.3'

LABEL org.opencontainers.image.title='HLint'
LABEL org.opencontainers.image.url='https://github.com/ndmitchell/hlint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Haskell'
LABEL info.evolutics.buffet.versions-url='https://hackage.haskell.org/package/hlint'

RUN apk add --no-cache \
    "cabal~=${hlint_cabal}" \
    "ghc~=${hlint_ghc}" \
    "gmp~=${hlint_gmp}" \
    "libffi~=${hlint_libffi}" \
    "musl-dev~=${hlint_musl_dev}" \
    "ncurses-dev~=${hlint_ncurses_dev}" \
    "wget~=${hlint_wget}" \
  \
  && cabal v2-update \
  && cabal v2-install --jobs alex happy \
  && cabal v2-install --jobs "hlint-${hlint}" \
  && ln -s "${HOME}/.cabal/bin/hlint" /usr/local/bin/hlint

WORKDIR /workdir

HEALTHCHECK CMD echo 'foo = fmap . fmap' | hlint -

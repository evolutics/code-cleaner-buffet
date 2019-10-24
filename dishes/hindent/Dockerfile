ARG _alpine='3.10.2'
ARG hindent
ARG hindent_haskell_stack="haskell-stack-${hindent:+3.10.2}"

FROM evolutics/code-cleaner-buffet:"${hindent_haskell_stack}" AS hindent
ARG hindent
RUN stack --jobs "$(nproc)" install --ghc-options='-fPIC -optl-static' \
    "hindent-${hindent}"

FROM alpine:"${_alpine}"
ARG _apk_gmp_dev='6.1.2'

LABEL org.opencontainers.image.title='hindent'
LABEL org.opencontainers.image.url='https://github.com/chrisdone/hindent'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Haskell'
LABEL info.evolutics.buffet.versions-url='https://hackage.haskell.org/package/hindent'

RUN apk add --no-cache "gmp-dev~=${_apk_gmp_dev}"
COPY --from=hindent /root/.local/bin/hindent /usr/local/bin/

WORKDIR /workdir

HEALTHCHECK CMD echo 'example = case x of Just p -> foo bar' | hindent

ARG _alpine='3.12.0'
ARG hindent
ARG hindent_haskell_stack="haskell-stack-${hindent:+b3b51795c96b4ebd}"

FROM evolutics/code-cleaner-buffet:"${hindent_haskell_stack}" AS hindent
ARG _hindent_stack_resolver='lts-14.27'
ARG hindent
RUN stack --resolver "${_hindent_stack_resolver}" install \
    --ghc-options='-fPIC -optl-static' "hindent-${hindent}" \
  && mv /root/.local/bin/hindent /usr/local/bin/

FROM alpine:"${_alpine}"
ARG _apk_gmp_dev=''

LABEL org.opencontainers.image.title='hindent'
LABEL org.opencontainers.image.url='https://github.com/chrisdone/hindent'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Haskell'
LABEL info.evolutics.buffet.versions-url='https://hackage.haskell.org/package/hindent'
LABEL info.evolutics.buffet.version-example='5.3.1'

RUN apk add --no-cache "gmp-dev${_apk_gmp_dev}"
COPY --from=hindent /usr/local/bin/hindent /usr/local/bin/

WORKDIR /workdir

HEALTHCHECK CMD hindent --version \
  && echo 'example = case x of Just p -> foo bar' | hindent

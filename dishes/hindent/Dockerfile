ARG _alpine='3.13.5'
ARG hindent
ARG hindent_conditional_image_repository="${hindent:+evolutics/hindent}"
ARG hindent_image_repository="${hindent_conditional_image_repository:-alpine}"
ARG hindent_image_tag="${hindent:-${_alpine}}"

FROM "${hindent_image_repository}:${hindent_image_tag}" AS hindent
RUN mkdir -p /var/empty

FROM alpine:"${_alpine}"
ARG _apk_gmp_dev=''

LABEL org.opencontainers.image.title='hindent'
LABEL org.opencontainers.image.url='https://github.com/mihaimaruseac/hindent'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Haskell'
LABEL info.evolutics.buffet.versions-url='https://hackage.haskell.org/package/hindent'
LABEL info.evolutics.buffet.version-example='5.3.1'

RUN apk add --no-cache "gmp-dev${_apk_gmp_dev}" \
  && wget --output-document /etc/apk/keys/sgerrand.rsa.pub \
    https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
  && wget \
    https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk \
  && apk add --no-cache glibc-2.32-r0.apk \
  && rm glibc-2.32-r0.apk
COPY --from=hindent /usr/local/bin/hindent /usr/local/bin/
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/lib:/usr/lib"

WORKDIR /workdir

HEALTHCHECK CMD hindent --version \
  && echo 'example = case x of Just p -> foo bar' | hindent

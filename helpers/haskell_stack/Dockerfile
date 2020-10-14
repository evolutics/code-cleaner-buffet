ARG alpine='3.12.0'

FROM alpine:"${alpine}"

ARG bootstrap_ghc='8.8.3'
ARG ghcs='8.6.5 8.8.4'
ARG ghcup='0.1.11'
ARG stack='v2.3.3'

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

RUN apk add --no-cache \
    "ghc~=${bootstrap_ghc}" \
    autoconf~=2.69 \
    automake~=1.16.2 \
    binutils-gold~=2.34 \
    curl~=7.69.1 \
    g++~=9.3.0 \
    gcc~=9.3.0 \
    gmp-dev~=6.2.0 \
    make~=4.3 \
    ncurses-dev~=6.2_p20200523 \
    perl~=5.30.3 \
    python3~=3.8.5 \
    xz~=5.2.5 \
  \
  && wget --output-document ghcup \
    "https://downloads.haskell.org/~ghcup/${ghcup}/x86_64-linux-ghcup-${ghcup}" \
  && chmod +x ghcup \
  && echo 'BuildFlavour = quick' > build.mk \
  && for ghc in ${ghcs}; do \
      LD=ld.gold ./ghcup --verbose compile ghc \
        --bootstrap-ghc "${bootstrap_ghc}" --config "$(pwd)/build.mk" \
        --jobs "$(nproc)" --version "${ghc}" \
    ; done \
  && rm build.mk ghcup \
  && apk del ghc \
  \
  && wget --output-document - \
    "https://raw.githubusercontent.com/commercialhaskell/stack/${stack}/etc/scripts/get-stack.sh" \
    | sh \
  && stack config set system-ghc --global true

ENV PATH="/root/.ghcup/bin:${PATH}"

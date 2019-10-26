ARG alpine='3.10.2'

FROM alpine:"${alpine}"

ARG ghc='8.6.5'
ARG ghcup='6a126e6bfe44a3bbebb7703a45b44fe75909bc6f'
ARG stack='e57c0154f3a272702db515cc3520d0394231697c'

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

RUN apk add --no-cache \
    autoconf~=2.69 \
    automake~=1.16.1 \
    binutils-gold~=2.32 \
    curl~=7.66.0 \
    g++~=8.3.0 \
    gcc~=8.3.0 \
    ghc~=8.4.3 \
    gmp-dev~=6.1.2 \
    make~=4.2.1 \
    ncurses-dev~=6.1_p20190518 \
    perl~=5.28.2 \
    python3~=3.7.5 \
    xz~=5.2.4 \
  \
  && wget "https://gitlab.haskell.org/haskell/ghcup/raw/${ghcup}/ghcup" \
  && chmod +x ghcup \
  && echo 'BuildFlavour = quick' > build.mk \
  && LD=ld.gold ./ghcup --verbose compile --build-config build.mk --force \
    --jobs "$(nproc)" "${ghc}" ghc \
  && rm build.mk ghcup \
  \
  && wget --output-document - \
    "https://raw.githubusercontent.com/commercialhaskell/stack/${stack}/etc/scripts/get-stack.sh" \
    | sh \
  && stack config set system-ghc --global true

ENV PATH="/root/.ghcup/bin:${PATH}"

ARG alpine='3.10.3'

FROM alpine:"${alpine}"

ARG ghc='8.6.5'
ARG ghcup='4f345d109a432c3d739f651b307912059abfb2f8'
ARG stack='v2.1.3'

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

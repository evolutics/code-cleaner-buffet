ARG _alpine='3.11.0'
ARG shellcheck
ARG shellcheck_haskell_stack="haskell-stack-${shellcheck:+b01d57793ffe8174}"

FROM evolutics/code-cleaner-buffet:"${shellcheck_haskell_stack}" AS shellcheck
ARG shellcheck
RUN stack --jobs "$(nproc)" install --ghc-options='-fPIC -optl-static' \
    "ShellCheck-${shellcheck}"

FROM alpine:"${_alpine}"
ARG _apk_gmp_dev='6.1.2'

LABEL org.opencontainers.image.title='ShellCheck'
LABEL org.opencontainers.image.url='https://www.shellcheck.net'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Shell'
LABEL info.evolutics.buffet.versions-url='https://hackage.haskell.org/package/ShellCheck'
LABEL info.evolutics.buffet.version-example='0.7.0'

RUN apk add --no-cache "gmp-dev~=${_apk_gmp_dev}"
COPY --from=shellcheck /root/.local/bin/shellcheck /usr/local/bin/

WORKDIR /workdir

HEALTHCHECK CMD shellcheck --version \
  && printf '#!/bin/bash\necho "Hi"\n' > main.sh \
  && shellcheck main.sh

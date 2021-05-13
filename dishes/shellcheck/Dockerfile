ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG shellcheck

LABEL org.opencontainers.image.title='ShellCheck'
LABEL org.opencontainers.image.url='https://www.shellcheck.net'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Shell'
LABEL info.evolutics.buffet.versions-url='https://hackage.haskell.org/package/ShellCheck'
LABEL info.evolutics.buffet.version-example='0.7.2'

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

RUN mkdir /opt/shellcheck \
  && wget --output-document - \
    "https://github.com/koalaman/shellcheck/releases/download/v${shellcheck}/shellcheck-v${shellcheck}.linux.x86_64.tar.xz" \
    | tar --directory /opt/shellcheck --extract --file - --strip-components 1 \
      --xz \
  && ln -s /opt/shellcheck/shellcheck /usr/local/bin/shellcheck

WORKDIR /workdir

HEALTHCHECK CMD shellcheck --version \
  && printf '#!/bin/bash\necho "Hi"\n' > main.sh \
  && shellcheck main.sh

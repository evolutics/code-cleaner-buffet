ARG _alpine='3.10.2'
ARG brittany=''
ARG git=''
ARG gitlint=''
ARG hadolint=''
ARG hindent
ARG hindent=''
ARG hindent_haskell_stack="haskell-stack-${hindent:+3.10.2}"
ARG hlint=''
ARG hunspell=''
ARG prettier=''

FROM evolutics/code-cleaner-buffet:"${hindent_haskell_stack}" AS hindent
ARG hindent
RUN if [ -n "${hindent}" ]; then \
    stack --jobs "$(nproc)" install --ghc-options='-fPIC -optl-static' \
      "hindent-${hindent}" \
  ; fi

FROM alpine:"${_alpine}"

ARG brittany
ARG brittany_cabal='2.4.1.0'
ARG brittany_ghc='8.4.3'
ARG brittany_gmp='6.1.2'
ARG brittany_libffi='3.2.1'
ARG brittany_musl_dev='1.1.22'
ARG brittany_ncurses_dev='6.1_p20190518'
ARG brittany_wget='1.20.3'
ARG git
ARG gitlint
ARG gitlint_git='2.22.0'
ARG gitlint_python3='3.7.5'
ARG hadolint
ARG hadolint_curl='7.66.0'
ARG hindent
ARG hindent_gmp_dev='6.1.2'
ARG hlint
ARG hlint_cabal='2.4.1.0'
ARG hlint_ghc='8.4.3'
ARG hlint_gmp='6.1.2'
ARG hlint_libffi='3.2.1'
ARG hlint_musl_dev='1.1.22'
ARG hlint_ncurses_dev='6.1_p20190518'
ARG hlint_wget='1.20.3'
ARG hunspell
ARG hunspell_hunspell_en='2018.04.16'
ARG prettier
ARG prettier_yarn='1.16.0'
RUN if [ -n "${brittany}" ]; then \
    apk add --no-cache \
      "cabal~=${brittany_cabal}" \
      "ghc~=${brittany_ghc}" \
      "gmp~=${brittany_gmp}" \
      "libffi~=${brittany_libffi}" \
      "musl-dev~=${brittany_musl_dev}" \
      "ncurses-dev~=${brittany_ncurses_dev}" \
      "wget~=${brittany_wget}" \
    \
    && cabal v2-update \
    && cabal v2-install --jobs "brittany-${brittany}" \
    && ln -s "${HOME}/.cabal/bin/brittany" /usr/local/bin/brittany \
  ; fi \
  && if [ -n "${git}" ]; then \
    apk add --no-cache \
      "git~=${git}" \
  ; fi \
  && if [ -n "${gitlint}" ]; then \
    apk add --no-cache \
      "git~=${gitlint_git}" \
      "python3~=${gitlint_python3}" \
    && pip3 install "gitlint==${gitlint}" \
  ; fi \
  && if [ -n "${hadolint}" ]; then \
    apk add --no-cache \
      "curl~=${hadolint_curl}" \
    && curl --fail --location --show-error --silent \
      "https://github.com/hadolint/hadolint/releases/download/v${hadolint}/hadolint-Linux-x86_64" \
      > /usr/local/bin/hadolint \
    && chmod +x /usr/local/bin/hadolint \
  ; fi \
  && if [ -n "${hindent}" ]; then \
    apk add --no-cache \
      "gmp-dev~=${hindent_gmp_dev}" \
  ; fi \
  && if [ -n "${hlint}" ]; then \
    apk add --no-cache \
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
    && ln -s "${HOME}/.cabal/bin/hlint" /usr/local/bin/hlint \
  ; fi \
  && if [ -n "${hunspell}" ]; then \
    apk add --no-cache \
      "hunspell~=${hunspell}" \
      "hunspell-en~=${hunspell_hunspell_en}" \
  ; fi \
  && if [ -n "${prettier}" ]; then \
    apk add --no-cache \
      "yarn~=${prettier_yarn}" \
    && yarn global add "prettier@${prettier}" \
  ; fi
COPY --from=hindent /root/.local/bin/hindent* /var/empty /usr/local/bin/

WORKDIR /workdir

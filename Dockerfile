ARG _alpine='3.10.2'
ARG addons_linter=''
ARG black=''
ARG brittany=''
ARG clang_format=''
ARG eslint=''
ARG git=''
ARG gitlint=''
ARG google_java_format=''
ARG hadolint=''
ARG hindent
ARG hindent=''
ARG hindent_haskell_stack="haskell-stack-${hindent:+e3dae61404118f78}"
ARG hlint=''
ARG hunspell=''
ARG pmd=''
ARG prettier=''
ARG prettier_eslint=''
ARG pyflakes=''
ARG pylint=''
ARG repolinter=''
ARG spotbugs=''
ARG standard=''
ARG wemake_python_styleguide=''
ARG xo=''
ARG yapf=''

FROM evolutics/code-cleaner-buffet:"${hindent_haskell_stack}" AS hindent
ARG hindent
RUN if [ -n "${hindent}" ]; then \
    stack --jobs "$(nproc)" install --ghc-options='-fPIC -optl-static' \
      "hindent-${hindent}" \
  ; fi

FROM alpine:"${_alpine}"

ARG addons_linter
ARG _apk_yarn='1.16.0'
ARG black
ARG _apk_python3='3.7.5'
ARG brittany
ARG _apk_cabal='2.4.1.0'
ARG _apk_ghc='8.4.3'
ARG _apk_gmp='6.1.2'
ARG _apk_libffi='3.2.1'
ARG _apk_musl_dev='1.1.22'
ARG _apk_ncurses_dev='6.1_p20190518'
ARG _apk_wget='1.20.3'
ARG clang_format
ARG eslint
ARG _apk_yarn='1.16.0'
ARG git
ARG gitlint
ARG _apk_git='2.22.0'
ARG _apk_python3='3.7.5'
ARG google_java_format
ARG _apk_openjdk11_jre_headless='11.0.4'
ARG hadolint
ARG hindent
ARG _apk_gmp_dev='6.1.2'
ARG hlint
ARG _apk_cabal='2.4.1.0'
ARG _apk_ghc='8.4.3'
ARG _apk_gmp='6.1.2'
ARG _apk_libffi='3.2.1'
ARG _apk_musl_dev='1.1.22'
ARG _apk_ncurses_dev='6.1_p20190518'
ARG _apk_wget='1.20.3'
ARG hunspell
ARG _apk_hunspell_en='2018.04.16'
ARG pmd
ARG _apk_bash='5.0.0'
ARG _apk_openjdk11_jre_headless='11.0.4'
ARG prettier
ARG _apk_yarn='1.16.0'
ARG prettier_eslint
ARG _apk_yarn='1.16.0'
ARG pyflakes
ARG _apk_python3='3.7.5'
ARG pylint
ARG _apk_gcc='8.3.0'
ARG _apk_musl_dev='1.1.22'
ARG _apk_python3_dev='3.7.5'
ARG repolinter
ARG _apk_yarn='1.16.0'
ARG spotbugs
ARG _apk_openjdk11_jre_headless='11.0.4'
SHELL ["/bin/ash", "-o", "pipefail", "-c"]
ARG standard
ARG _apk_yarn='1.16.0'
ARG wemake_python_styleguide
ARG _apk_python3='3.7.5'
ARG xo
ARG _apk_yarn='1.16.0'
ARG yapf
ARG _apk_python3='3.7.5'
RUN if [ -n "${addons_linter}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}" \
    && yarn global add "addons-linter@${addons_linter}" \
  ; fi \
  && if [ -n "${black}" ]; then \
    apk add --no-cache "python3~=${_apk_python3}" \
    && pip3 install "black==${black}" \
  ; fi \
  && if [ -n "${brittany}" ]; then \
    apk add --no-cache \
      "cabal~=${_apk_cabal}" \
      "ghc~=${_apk_ghc}" \
      "gmp~=${_apk_gmp}" \
      "libffi~=${_apk_libffi}" \
      "musl-dev~=${_apk_musl_dev}" \
      "ncurses-dev~=${_apk_ncurses_dev}" \
      "wget~=${_apk_wget}" \
    \
    && cabal v2-update \
    && cabal v2-install --jobs "brittany-${brittany}" \
    && ln -s "${HOME}/.cabal/bin/brittany" /usr/local/bin/brittany \
  ; fi \
  && if [ -n "${clang_format}" ]; then \
    apk add --no-cache "clang~=${clang_format}" \
  ; fi \
  && if [ -n "${eslint}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}" \
    && yarn global add "eslint@${eslint}" \
  ; fi \
  && if [ -n "${git}" ]; then \
    apk add --no-cache "git~=${git}" \
  ; fi \
  && if [ -n "${gitlint}" ]; then \
    apk add --no-cache \
      "git~=${_apk_git}" \
      "python3~=${_apk_python3}" \
    && pip3 install "gitlint==${gitlint}" \
  ; fi \
  && if [ -n "${google_java_format}" ]; then \
    apk add --no-cache \
      "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}" \
    && mkdir /opt/google-java-format \
    && wget --output-document /opt/google-java-format/google-java-format.jar \
      "https://github.com/google/google-java-format/releases/download/google-java-format-${google_java_format}/google-java-format-${google_java_format}-all-deps.jar" \
    && printf '#!/bin/sh\n\njava -jar /opt/google-java-format/google-java-format.jar "$@"\n' \
      > /usr/local/bin/google-java-format \
    && chmod +x /usr/local/bin/google-java-format \
  ; fi \
  && if [ -n "${hadolint}" ]; then \
    wget --output-document /usr/local/bin/hadolint \
      "https://github.com/hadolint/hadolint/releases/download/v${hadolint}/hadolint-Linux-x86_64" \
    && chmod +x /usr/local/bin/hadolint \
  ; fi \
  && if [ -n "${hindent}" ]; then \
    apk add --no-cache "gmp-dev~=${_apk_gmp_dev}" \
  ; fi \
  && if [ -n "${hlint}" ]; then \
    apk add --no-cache \
      "cabal~=${_apk_cabal}" \
      "ghc~=${_apk_ghc}" \
      "gmp~=${_apk_gmp}" \
      "libffi~=${_apk_libffi}" \
      "musl-dev~=${_apk_musl_dev}" \
      "ncurses-dev~=${_apk_ncurses_dev}" \
      "wget~=${_apk_wget}" \
    \
    && cabal v2-update \
    && cabal v2-install --jobs alex happy \
    && cabal v2-install --jobs "hlint-${hlint}" \
    && ln -s "${HOME}/.cabal/bin/hlint" /usr/local/bin/hlint \
  ; fi \
  && if [ -n "${hunspell}" ]; then \
    apk add --no-cache \
      "hunspell~=${hunspell}" \
      "hunspell-en~=${_apk_hunspell_en}" \
  ; fi \
  && if [ -n "${pmd}" ]; then \
    apk add --no-cache \
      "bash~=${_apk_bash}" \
      "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}" \
    && wget --output-document /tmp/pmd.zip \
      "https://github.com/pmd/pmd/releases/download/pmd_releases%2F${pmd}/pmd-bin-${pmd}.zip" \
    && unzip -d /opt /tmp/pmd.zip \
    && rm /tmp/pmd.zip \
    && mv "/opt/pmd-bin-${pmd}" /opt/pmd \
    && ln -s /opt/pmd/bin/run.sh /usr/local/bin/pmd \
  ; fi \
  && if [ -n "${prettier}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}" \
    && yarn global add "prettier@${prettier}" \
  ; fi \
  && if [ -n "${prettier_eslint}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}" \
    && yarn global add "prettier-eslint-cli@${prettier_eslint}" \
  ; fi \
  && if [ -n "${pyflakes}" ]; then \
    apk add --no-cache "python3~=${_apk_python3}" \
    && pip3 install "pyflakes==${pyflakes}" \
  ; fi \
  && if [ -n "${pylint}" ]; then \
    apk add --no-cache \
      "gcc~=${_apk_gcc}" \
      "musl-dev~=${_apk_musl_dev}" \
      "python3-dev~=${_apk_python3_dev}" \
    && pip3 install "pylint==${pylint}" \
  ; fi \
  && if [ -n "${repolinter}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}" \
    && yarn global add "repolinter@${repolinter}" \
  ; fi \
  && if [ -n "${spotbugs}" ]; then \
    apk add --no-cache \
      "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}" \
    && mkdir /opt/spotbugs \
    && wget --output-document - \
      "http://repo.maven.apache.org/maven2/com/github/spotbugs/spotbugs/${spotbugs}/spotbugs-${spotbugs}.tgz" \
      | tar --directory /opt/spotbugs --extract --file - --gzip \
     \
     --strip-components 1 \
    && ln -s /opt/spotbugs/bin/spotbugs /usr/local/bin/spotbugs \
  ; fi \
  && if [ -n "${standard}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}" \
    && yarn global add "standard@${standard}" \
  ; fi \
  && if [ -n "${wemake_python_styleguide}" ]; then \
    apk add --no-cache "python3~=${_apk_python3}" \
    && pip3 install "wemake-python-styleguide==${wemake_python_styleguide}" \
  ; fi \
  && if [ -n "${xo}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}" \
    && yarn global add "xo@${xo}" \
  ; fi \
  && if [ -n "${yapf}" ]; then \
    apk add --no-cache "python3~=${_apk_python3}" \
    && pip3 install "yapf==${yapf}" \
  ; fi
COPY --from=hindent /root/.local/bin/hindent* /var/empty /usr/local/bin/

WORKDIR /workdir

ARG _alpine='3.10.3'
ARG hindent
ARG hindent_haskell_stack="haskell-stack-${hindent:+e317e1188a5adf4a}"
ARG shellcheck
ARG shellcheck_haskell_stack="haskell-stack-${shellcheck:+e317e1188a5adf4a}"

FROM alpine:"${_alpine}" AS black
ARG _apk_gcc='8.3.0'
ARG _apk_musl_dev='1.1.22'
ARG _apk_python3_dev='3.7.5'
ARG black
#  hadolint ignore=DL3013
RUN if [ -n "${black}" ]; then \
    apk add --no-cache     "gcc~=${_apk_gcc}"     "musl-dev~=${_apk_musl_dev}"     "python3-dev~=${_apk_python3_dev}"   && pip3 install --target /opt/black "black==${black}" \
  ; fi

FROM evolutics/code-cleaner-buffet:"${hindent_haskell_stack}" AS hindent
ARG hindent
RUN if [ -n "${hindent}" ]; then \
    stack --jobs "$(nproc)" install --ghc-options='-fPIC -optl-static'     "hindent-${hindent}" \
  ; fi

FROM evolutics/code-cleaner-buffet:"${shellcheck_haskell_stack}" AS shellcheck
ARG shellcheck
RUN if [ -n "${shellcheck}" ]; then \
    stack --jobs "$(nproc)" install --ghc-options='-fPIC -optl-static'     "ShellCheck-${shellcheck}" \
  ; fi

FROM alpine:"${_alpine}"
ARG _apk_aspell_en='2018.04.16'
ARG _apk_bash='5.0.0'
ARG _apk_build_base='0.5'
ARG _apk_cabal='2.4.1.0'
ARG _apk_cmake='3.14.5'
ARG _apk_composer='1.8.6'
ARG _apk_gcc='8.3.0'
ARG _apk_ghc='8.4.3'
ARG _apk_git='2.22.0'
ARG _apk_gmp='6.1.2'
ARG _apk_gmp_dev='6.1.2'
ARG _apk_go='1.12.12'
ARG _apk_hunspell_en='2018.04.16'
ARG _apk_libffi='3.2.1'
ARG _apk_musl_dev='1.1.22'
ARG _apk_ncurses_dev='6.1_p20190518'
ARG _apk_ninja='1.9.0'
ARG _apk_npm='10.16.3'
ARG _apk_openjdk11_jre_headless='11.0.4_p4'
ARG _apk_python3='3.7.5'
ARG _apk_python3_dev='3.7.5'
ARG _apk_ruby_dev='2.5.7'
ARG _apk_ruby_full='2.5.7'
ARG _apk_wget='1.20.3'
ARG _apk_yarn='1.16.0'
ARG _coursier='1.1.0-M14-7'
ARG _yarn_prettier='1.19.1'
ARG _yarn_stylelint_config_recommended_scss='4.0.0'
ARG _yarn_stylelint_config_recommended='3.0.0'
ARG _yarn_stylelint_config_standard='19.0.0'
ARG _yarn_typescript='3.7.2'
ARG addons_linter
ARG aspell
ARG astyle
ARG black
ARG bootlint
ARG brittany
ARG clang_format
ARG clang_tidy
ARG cpplint
ARG csscomb
ARG csslint
ARG doiuse
ARG eslint
ARG git
ARG gitlint
ARG gofmt
ARG golangci_lint
ARG google_java_format
ARG hadolint
ARG hindent
ARG hlint
ARG htmllint
ARG hunspell
ARG jsonlint
ARG ktlint
ARG luafmt
ARG mix
ARG phplint
ARG pmd
ARG prettier
ARG prettier_eslint
ARG prettier_java
ARG prettier_php
ARG prettier_ruby
ARG prettier_toml
ARG prettier_xml
ARG pyflakes
ARG pylint
ARG repolinter
ARG rubocop
ARG scalafmt
ARG shellcheck
ARG spotbugs
ARG standard
ARG stylelint
ARG tidy
ARG tslint
ARG vnu
ARG wemake_python_styleguide
ARG xmllint
ARG xo
ARG yamllint
ARG yapf
SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN if [ -n "${addons_linter}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "addons-linter@${addons_linter}" \
  ; fi \
  && if [ -n "${aspell}" ]; then \
    apk add --no-cache     "aspell~=${aspell}"     "aspell-en~=${_apk_aspell_en}" \
  ; fi \
  && if [ -n "${astyle}" ]; then \
    apk add --no-cache "astyle~=${astyle}" \
  ; fi \
  && if [ -n "${black}" ]; then \
    apk add --no-cache "python3~=${_apk_python3}" \
  ; fi \
  && if [ -n "${bootlint}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "bootlint@${bootlint}" \
  ; fi \
  && if [ -n "${brittany}" ]; then \
    apk add --no-cache     "cabal~=${_apk_cabal}"     "ghc~=${_apk_ghc}"     "gmp~=${_apk_gmp}"     "libffi~=${_apk_libffi}"     "musl-dev~=${_apk_musl_dev}"     "ncurses-dev~=${_apk_ncurses_dev}"     "wget~=${_apk_wget}"     && cabal v2-update   && cabal v2-install --jobs "brittany-${brittany}"   && ln -s "${HOME}/.cabal/bin/brittany" /usr/local/bin/brittany \
  ; fi \
  && if [ -n "${clang_format}" ]; then \
    apk add --no-cache "clang~=${clang_format}" \
  ; fi \
  && if [ -n "${cpplint}" ]; then \
    apk add --no-cache "python3~=${_apk_python3}"   && pip3 install "cpplint==${cpplint}" \
  ; fi \
  && if [ -n "${csscomb}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "csscomb@${csscomb}" \
  ; fi \
  && if [ -n "${csslint}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "csslint@${csslint}" \
  ; fi \
  && if [ -n "${doiuse}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "doiuse@${doiuse}" \
  ; fi \
  && if [ -n "${eslint}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "eslint@${eslint}" \
  ; fi \
  && if [ -n "${git}" ]; then \
    apk add --no-cache "git~=${git}" \
  ; fi \
  && if [ -n "${gitlint}" ]; then \
    apk add --no-cache     "git~=${_apk_git}"     "python3~=${_apk_python3}"   && pip3 install "gitlint==${gitlint}" \
  ; fi \
  && if [ -n "${gofmt}" ]; then \
    wget --output-document -     "https://dl.google.com/go/go${gofmt}.linux-amd64.tar.gz"     | tar --directory /usr/local/bin --extract --file - --gzip     --strip-components 2 go/bin/gofmt \
  ; fi \
  && if [ -n "${golangci_lint}" ]; then \
    apk add --no-cache "go~=${_apk_go}"   && wget --output-document -     https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh     | sh -s "v${golangci_lint}" \
  ; fi \
  && if [ -n "${google_java_format}" ]; then \
    apk add --no-cache     "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}"   && mkdir /opt/google-java-format   && wget --output-document /opt/google-java-format/google-java-format.jar     "https://github.com/google/google-java-format/releases/download/google-java-format-${google_java_format}/google-java-format-${google_java_format}-all-deps.jar"   && printf '#!/bin/sh\n\njava -jar /opt/google-java-format/google-java-format.jar "$@"\n'     > /usr/local/bin/google-java-format   && chmod +x /usr/local/bin/google-java-format \
  ; fi \
  && if [ -n "${hadolint}" ]; then \
    wget --output-document /usr/local/bin/hadolint     "https://github.com/hadolint/hadolint/releases/download/v${hadolint}/hadolint-Linux-x86_64"   && chmod +x /usr/local/bin/hadolint \
  ; fi \
  && if [ -n "${hindent}" ]; then \
    apk add --no-cache "gmp-dev~=${_apk_gmp_dev}" \
  ; fi \
  && if [ -n "${hlint}" ]; then \
    apk add --no-cache     "cabal~=${_apk_cabal}"     "ghc~=${_apk_ghc}"     "gmp~=${_apk_gmp}"     "libffi~=${_apk_libffi}"     "musl-dev~=${_apk_musl_dev}"     "ncurses-dev~=${_apk_ncurses_dev}"     "wget~=${_apk_wget}"     && cabal v2-update   && cabal v2-install --jobs alex happy   && cabal v2-install --jobs "hlint-${hlint}"   && ln -s "${HOME}/.cabal/bin/hlint" /usr/local/bin/hlint \
  ; fi \
  && if [ -n "${htmllint}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "htmllint-cli@${htmllint}" \
  ; fi \
  && if [ -n "${hunspell}" ]; then \
    apk add --no-cache     "hunspell~=${hunspell}"     "hunspell-en~=${_apk_hunspell_en}" \
  ; fi \
  && if [ -n "${jsonlint}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "jsonlint@${jsonlint}" \
  ; fi \
  && if [ -n "${ktlint}" ]; then \
    apk add --no-cache     "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}"   && wget --directory-prefix /usr/local/bin     "https://github.com/pinterest/ktlint/releases/download/${ktlint}/ktlint"   && chmod +x /usr/local/bin/ktlint \
  ; fi \
  && if [ -n "${luafmt}" ]; then \
    apk add --no-cache     "git~=${_apk_git}"     "yarn~=${_apk_yarn}"   && yarn global add "lua-fmt@${luafmt}" \
  ; fi \
  && if [ -n "${mix}" ]; then \
    apk add --no-cache "elixir~=${mix}" \
  ; fi \
  && if [ -n "${phplint}" ]; then \
    apk add --no-cache "composer~=${_apk_composer}"   && composer global require "overtrue/phplint:${phplint}"   && ln -s "${HOME}/.composer/vendor/bin/phplint" /usr/local/bin/phplint \
  ; fi \
  && if [ -n "${pmd}" ]; then \
    apk add --no-cache     "bash~=${_apk_bash}"     "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}"   && tmp="$(mktemp -d)"   && wget --output-document "${tmp}/pmd.zip"     "https://github.com/pmd/pmd/releases/download/pmd_releases%2F${pmd}/pmd-bin-${pmd}.zip"   && unzip -d "${tmp}" "${tmp}/pmd.zip"   && mv "${tmp}/pmd-bin-${pmd}" /opt/pmd   && rm -fr "${tmp}"   && ln -s /opt/pmd/bin/run.sh /usr/local/bin/pmd \
  ; fi \
  && if [ -n "${prettier}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "prettier@${prettier}" \
  ; fi \
  && if [ -n "${prettier_eslint}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "prettier-eslint-cli@${prettier_eslint}" \
  ; fi \
  && if [ -n "${prettier_java}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add     "prettier-plugin-java@${prettier_java}"     "prettier@${_yarn_prettier}" \
  ; fi \
  && if [ -n "${prettier_php}" ]; then \
    apk add --no-cache     "git~=${_apk_git}"     "yarn~=${_apk_yarn}"   && yarn global add     "@prettier/plugin-php@${prettier_php}"     "prettier@${_yarn_prettier}" \
  ; fi \
  && if [ -n "${prettier_ruby}" ]; then \
    apk add --no-cache     "ruby-full~=${_apk_ruby_full}"     "yarn~=${_apk_yarn}"   && yarn global add     "@prettier/plugin-ruby@${prettier_ruby}"     "prettier@${_yarn_prettier}" \
  ; fi \
  && if [ -n "${prettier_toml}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add     "prettier-plugin-toml@${prettier_toml}"     "prettier@${_yarn_prettier}" \
  ; fi \
  && if [ -n "${prettier_xml}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add     "@prettier/plugin-xml@${prettier_xml}"     "prettier@${_yarn_prettier}" \
  ; fi \
  && if [ -n "${pyflakes}" ]; then \
    apk add --no-cache "python3~=${_apk_python3}"   && pip3 install "pyflakes==${pyflakes}" \
  ; fi \
  && if [ -n "${pylint}" ]; then \
    apk add --no-cache     "gcc~=${_apk_gcc}"     "musl-dev~=${_apk_musl_dev}"     "python3-dev~=${_apk_python3_dev}"   && pip3 install "pylint==${pylint}" \
  ; fi \
  && if [ -n "${repolinter}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "repolinter@${repolinter}" \
  ; fi \
  && if [ -n "${rubocop}" ]; then \
    apk add --no-cache     "build-base~=${_apk_build_base}"     "ruby-dev~=${_apk_ruby_dev}"     "ruby-full~=${_apk_ruby_full}"   && gem install --no-document "rubocop:${rubocop}" \
  ; fi \
  && if [ -n "${scalafmt}" ]; then \
    apk add --no-cache     "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}"   && coursier_executable="$(mktemp)"   && wget --output-document "${coursier_executable}"     "https://github.com/coursier/coursier/releases/download/v${_coursier}/coursier"   && chmod +x "${coursier_executable}"   && "${coursier_executable}" bootstrap "org.scalameta:scalafmt-cli_2.12:${scalafmt}"     --main org.scalafmt.cli.Cli --output /usr/local/bin/scalafmt     --repository sonatype:snapshots --standalone   && rm "${coursier_executable}" \
  ; fi \
  && if [ -n "${shellcheck}" ]; then \
    apk add --no-cache "gmp-dev~=${_apk_gmp_dev}" \
  ; fi \
  && if [ -n "${spotbugs}" ]; then \
    apk add --no-cache     "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}"   && mkdir /opt/spotbugs   && wget --output-document -     "http://repo.maven.apache.org/maven2/com/github/spotbugs/spotbugs/${spotbugs}/spotbugs-${spotbugs}.tgz"     | tar --directory /opt/spotbugs --extract --file - --gzip       --strip-components 1   && ln -s /opt/spotbugs/bin/spotbugs /usr/local/bin/spotbugs \
  ; fi \
  && if [ -n "${standard}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "standard@${standard}" \
  ; fi \
  && if [ -n "${stylelint}" ]; then \
    apk add --no-cache "npm~=${_apk_npm}"   && npm install --global     "stylelint-config-recommended-scss@${_yarn_stylelint_config_recommended_scss}"     "stylelint-config-recommended@${_yarn_stylelint_config_recommended}"     "stylelint-config-standard@${_yarn_stylelint_config_standard}"     "stylelint@${stylelint}" \
  ; fi \
  && if [ -n "${tidy}" ]; then \
    apk add --no-cache "tidyhtml~=${tidy}" \
  ; fi \
  && if [ -n "${tslint}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add     "tslint@${tslint}"     "typescript@${_yarn_typescript}" \
  ; fi \
  && if [ -n "${vnu}" ]; then \
    apk add --no-cache     "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}"   && vnu_archive="$(mktemp)"   && wget --output-document "${vnu_archive}"     "https://github.com/validator/validator/releases/download/${vnu}/vnu.jar_${vnu}.zip"   && mkdir /opt/vnu   && unzip -d /opt/vnu -j "${vnu_archive}" dist/vnu.jar   && rm "${vnu_archive}"   && printf '#!/bin/sh\n\njava -jar /opt/vnu/vnu.jar "$@"\n'     > /usr/local/bin/vnu   && chmod +x /usr/local/bin/vnu \
  ; fi \
  && if [ -n "${wemake_python_styleguide}" ]; then \
    apk add --no-cache "python3~=${_apk_python3}"   && pip3 install "wemake-python-styleguide==${wemake_python_styleguide}" \
  ; fi \
  && if [ -n "${xmllint}" ]; then \
    apk add --no-cache "libxml2-utils~=${xmllint}" \
  ; fi \
  && if [ -n "${xo}" ]; then \
    apk add --no-cache "yarn~=${_apk_yarn}"   && yarn global add "xo@${xo}" \
  ; fi \
  && if [ -n "${yamllint}" ]; then \
    apk add --no-cache "python3~=${_apk_python3}"   && pip3 install "yamllint==${yamllint}" \
  ; fi \
  && if [ -n "${yapf}" ]; then \
    apk add --no-cache "python3~=${_apk_python3}"   && pip3 install "yapf==${yapf}" \
  ; fi
COPY --from=black /opt/black* /var/empty /opt/black/
COPY --from=hindent /root/.local/bin/hindent* /var/empty /usr/local/bin/
COPY --from=shellcheck /root/.local/bin/shellcheck* /var/empty /usr/local/bin/
WORKDIR /workdir
ENV PATH="${PATH}:/opt/black/bin"
#  hadolint ignore=DL3003
RUN if [ -n "${clang_tidy}" ]; then \
    apk add --no-cache     "build-base~=${_apk_build_base}"     "cmake~=${_apk_cmake}"     "ninja~=${_apk_ninja}"     "python3~=${_apk_python3}"   && tmp="$(mktemp -d)"   && mkdir "${tmp}/llvm"   && wget --output-document -     "http://releases.llvm.org/${clang_tidy}/llvm-${clang_tidy}.src.tar.xz"     | tar --directory "${tmp}/llvm" --extract --file - --strip-components 1       --xz   && wget --output-document -     "http://releases.llvm.org/${clang_tidy}/cfe-${clang_tidy}.src.tar.xz"     | tar --directory "${tmp}/llvm/tools" --extract --file - --xz   && mkdir "${tmp}/llvm/tools/cfe-${clang_tidy}.src/tools/extra"   && wget --output-document -     "http://releases.llvm.org/${clang_tidy}/clang-tools-extra-${clang_tidy}.src.tar.xz"     | tar --directory "${tmp}/llvm/tools/cfe-${clang_tidy}.src/tools/extra"       --extract --file - --strip-components 1 --xz   && mkdir "${tmp}/build"   && cd "${tmp}/build"   && cmake -G Ninja ../llvm   && ninja clang-tidy   && mv "${tmp}/build/bin/clang-tidy" /usr/local/bin   && rm -fr "${tmp}" \
  ; fi
WORKDIR /workdir
ENV PYTHONPATH="${PYTHONPATH}:/opt/black"
WORKDIR /workdir

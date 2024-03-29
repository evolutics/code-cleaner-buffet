ARG _alpine='3.13.5'
ARG hindent
ARG hindent_conditional_image_repository="${hindent:+evolutics/hindent}"
ARG hindent_image_repository="${hindent_conditional_image_repository:-alpine}"
ARG hindent_image_tag="${hindent:-${_alpine}}"

FROM alpine:"${_alpine}" AS black
ARG _apk_gcc=''
ARG _apk_musl_dev=''
ARG _apk_py3_pip=''
ARG _apk_python3_dev=''
ARG black
RUN if [ -n "${black}" ]; then apk add --no-cache "gcc${_apk_gcc}" "musl-dev${_apk_musl_dev}" "py3-pip${_apk_py3_pip}" "python3-dev${_apk_python3_dev}" \
 && pip install --no-cache-dir --target /opt/black "black==${black}"; fi

FROM alpine:"${_alpine}" AS clang_tidy
ARG _apk_build_base=''
ARG _apk_cmake=''
ARG _apk_ninja=''
ARG _apk_python3=''
ARG clang_tidy
SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN if [ -n "${clang_tidy}" ]; then apk add --no-cache "build-base${_apk_build_base}" "cmake${_apk_cmake}" "ninja${_apk_ninja}" "python3${_apk_python3}" \
 && mkdir /opt/llvm \
 && wget --no-verbose --output-document - "https://github.com/llvm/llvm-project/releases/download/llvmorg-${clang_tidy}/llvm-${clang_tidy}.src.tar.xz" | tar --directory /opt/llvm --extract --file - --strip-components 1 --xz \
 && wget --no-verbose --output-document - "https://github.com/llvm/llvm-project/releases/download/llvmorg-${clang_tidy}/clang-${clang_tidy}.src.tar.xz" | tar --directory /opt/llvm/tools --extract --file - --xz \
 && mkdir "/opt/llvm/tools/clang-${clang_tidy}.src/tools/extra" \
 && wget --no-verbose --output-document - "https://github.com/llvm/llvm-project/releases/download/llvmorg-${clang_tidy}/clang-tools-extra-${clang_tidy}.src.tar.xz" | tar --directory "/opt/llvm/tools/clang-${clang_tidy}.src/tools/extra" --extract --file - --strip-components 1 --xz; fi
WORKDIR /opt/build
RUN if [ -n "${clang_tidy}" ]; then cmake -G Ninja ../llvm \
 && ninja clang-tidy \
 && mv /opt/build/bin/clang-tidy /usr/local/bin/; fi

FROM "${hindent_image_repository}:${hindent_image_tag}" AS hindent
ARG hindent
RUN if [ -n "${hindent}" ]; then mkdir -p /var/empty; fi

FROM alpine:"${_alpine}" AS pylint
ARG _apk_gcc=''
ARG _apk_musl_dev=''
ARG _apk_py3_pip=''
ARG _apk_python3_dev=''
ARG pylint
RUN if [ -n "${pylint}" ]; then apk add --no-cache "gcc${_apk_gcc}" "musl-dev${_apk_musl_dev}" "py3-pip${_apk_py3_pip}" "python3-dev${_apk_python3_dev}" \
 && pip install --no-cache-dir --target /opt/pylint "pylint==${pylint}"; fi

FROM alpine:"${_alpine}"
ARG _apk_aspell_en=''
ARG _apk_bash=''
ARG _apk_build_base=''
ARG _apk_cabal=''
ARG _apk_composer=''
ARG _apk_gcc=''
ARG _apk_ghc=''
ARG _apk_git=''
ARG _apk_gmp=''
ARG _apk_gmp_dev=''
ARG _apk_go=''
ARG _apk_hunspell_en=''
ARG _apk_libffi=''
ARG _apk_libffi_dev=''
ARG _apk_libstdcpp=''
ARG _apk_musl_dev=''
ARG _apk_ncurses_dev=''
ARG _apk_npm=''
ARG _apk_openjdk11_jre_headless=''
ARG _apk_openssl_dev=''
ARG _apk_py3_pip=''
ARG _apk_python3=''
ARG _apk_python3_dev=''
ARG _apk_ruby_dev=''
ARG _apk_ruby_full=''
ARG _apk_wget=''
ARG _apk_yarn=''
ARG _coursier='2.0.3'
ARG _yarn_prettier='2.3.0'
ARG _yarn_stylelint_config_recommended_scss='4.2.0'
ARG _yarn_stylelint_config_recommended='3.0.0'
ARG _yarn_stylelint_config_standard='20.0.0'
ARG _yarn_typescript='4.0.3'
ARG addons_linter
ARG ansible_lint
ARG aspell
ARG astyle
ARG black
ARG bootlint
ARG brittany
ARG clang_format
ARG clang_tidy
ARG commitlint
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
ARG htmlhint
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
ARG shfmt
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
RUN if [ -n "${addons_linter}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "addons-linter@${addons_linter}"; fi \
 && if [ -n "${ansible_lint}" ]; then apk add --no-cache "gcc${_apk_gcc}" "libffi-dev${_apk_libffi_dev}" "musl-dev${_apk_musl_dev}" "openssl-dev${_apk_openssl_dev}" "py3-pip${_apk_py3_pip}" "python3-dev${_apk_python3_dev}" \
 && pip install --no-cache-dir "ansible-lint==${ansible_lint}"; fi \
 && if [ -n "${aspell}" ]; then apk add --no-cache "aspell~=${aspell}" "aspell-en${_apk_aspell_en}"; fi \
 && if [ -n "${astyle}" ]; then apk add --no-cache "astyle~=${astyle}"; fi \
 && if [ -n "${black}" ]; then apk add --no-cache "python3${_apk_python3}"; fi \
 && if [ -n "${bootlint}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "bootlint@${bootlint}"; fi \
 && if [ -n "${brittany}" ]; then apk add --no-cache "cabal${_apk_cabal}" "ghc${_apk_ghc}" "gmp${_apk_gmp}" "libffi${_apk_libffi}" "musl-dev${_apk_musl_dev}" "ncurses-dev${_apk_ncurses_dev}" "wget${_apk_wget}" \
 && cabal v2-update \
 && cabal v2-install --jobs "brittany-${brittany}" \
 && ln -s "${HOME}/.cabal/bin/brittany" /usr/local/bin/brittany; fi \
 && if [ -n "${clang_format}" ]; then apk add --no-cache "clang~=${clang_format}"; fi \
 && if [ -n "${clang_tidy}" ]; then apk add --no-cache "libstdc++${_apk_libstdcpp}"; fi \
 && if [ -n "${commitlint}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "@commitlint/cli@${commitlint}"; fi \
 && if [ -n "${cpplint}" ]; then apk add --no-cache "py3-pip${_apk_py3_pip}" \
 && pip install --no-cache-dir "cpplint==${cpplint}"; fi \
 && if [ -n "${csscomb}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "csscomb@${csscomb}"; fi \
 && if [ -n "${csslint}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "csslint@${csslint}"; fi \
 && if [ -n "${doiuse}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "doiuse@${doiuse}"; fi \
 && if [ -n "${eslint}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "eslint@${eslint}"; fi \
 && if [ -n "${git}" ]; then apk add --no-cache "git~=${git}"; fi \
 && if [ -n "${gitlint}" ]; then apk add --no-cache "git${_apk_git}" "py3-pip${_apk_py3_pip}" \
 && pip install --no-cache-dir "gitlint==${gitlint}"; fi \
 && if [ -n "${gofmt}" ]; then wget --no-verbose --output-document - "https://dl.google.com/go/go${gofmt}.linux-amd64.tar.gz" | tar --directory /usr/local/bin --extract --file - --gzip --strip-components 2 go/bin/gofmt; fi \
 && if [ -n "${golangci_lint}" ]; then apk add --no-cache "go${_apk_go}" \
 && wget --no-verbose --output-document - https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s "v${golangci_lint}"; fi \
 && if [ -n "${google_java_format}" ]; then apk add --no-cache "openjdk11-jre-headless${_apk_openjdk11_jre_headless}" \
 && mkdir /opt/google-java-format \
 && wget --no-verbose --output-document /opt/google-java-format/google-java-format.jar "https://github.com/google/google-java-format/releases/download/google-java-format-${google_java_format}/google-java-format-${google_java_format}-all-deps.jar" \
 && printf '#!/bin/sh\n\njava -jar /opt/google-java-format/google-java-format.jar "$@"\n' > /usr/local/bin/google-java-format \
 && chmod +x /usr/local/bin/google-java-format; fi \
 && if [ -n "${hadolint}" ]; then wget --no-verbose --output-document /usr/local/bin/hadolint "https://github.com/hadolint/hadolint/releases/download/v${hadolint}/hadolint-Linux-x86_64" \
 && chmod +x /usr/local/bin/hadolint; fi \
 && if [ -n "${hindent}" ]; then apk add --no-cache "gmp-dev${_apk_gmp_dev}" \
 && wget --no-verbose --output-document /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
 && wget --no-verbose https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk \
 && apk add --no-cache glibc-2.32-r0.apk \
 && rm glibc-2.32-r0.apk; fi \
 && if [ -n "${hlint}" ]; then apk add --no-cache "cabal${_apk_cabal}" "ghc${_apk_ghc}" "gmp${_apk_gmp}" "libffi${_apk_libffi}" "musl-dev${_apk_musl_dev}" "ncurses-dev${_apk_ncurses_dev}" "wget${_apk_wget}" \
 && cabal v2-update \
 && cabal v2-install --jobs alex happy \
 && cabal v2-install --jobs "hlint-${hlint}" \
 && ln -s "${HOME}/.cabal/bin/hlint" /usr/local/bin/hlint; fi \
 && if [ -n "${htmlhint}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "htmlhint@${htmlhint}"; fi \
 && if [ -n "${htmllint}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "htmllint-cli@${htmllint}"; fi \
 && if [ -n "${hunspell}" ]; then apk add --no-cache "hunspell~=${hunspell}" "hunspell-en${_apk_hunspell_en}"; fi \
 && if [ -n "${jsonlint}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "jsonlint@${jsonlint}"; fi \
 && if [ -n "${ktlint}" ]; then apk add --no-cache "openjdk11-jre-headless${_apk_openjdk11_jre_headless}" \
 && wget --directory-prefix /usr/local/bin --no-verbose "https://github.com/pinterest/ktlint/releases/download/${ktlint}/ktlint" \
 && chmod +x /usr/local/bin/ktlint; fi \
 && if [ -n "${luafmt}" ]; then apk add --no-cache "git${_apk_git}" "yarn${_apk_yarn}" \
 && yarn global add "lua-fmt@${luafmt}"; fi \
 && if [ -n "${mix}" ]; then apk add --no-cache "elixir~=${mix}"; fi \
 && if [ -n "${phplint}" ]; then apk add --no-cache "composer${_apk_composer}" \
 && composer global require "overtrue/phplint:${phplint}" \
 && ln -s "${HOME}/.composer/vendor/bin/phplint" /usr/local/bin/phplint; fi \
 && if [ -n "${pmd}" ]; then apk add --no-cache "bash${_apk_bash}" "openjdk11-jre-headless${_apk_openjdk11_jre_headless}" \
 && tmp="$(mktemp -d)" \
 && wget --no-verbose --output-document "${tmp}/pmd.zip" "https://github.com/pmd/pmd/releases/download/pmd_releases%2F${pmd}/pmd-bin-${pmd}.zip" \
 && unzip -d "${tmp}" "${tmp}/pmd.zip" \
 && mv "${tmp}/pmd-bin-${pmd}" /opt/pmd \
 && rm -fr "${tmp}" \
 && ln -s /opt/pmd/bin/run.sh /usr/local/bin/pmd; fi \
 && if [ -n "${prettier}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "prettier@${prettier}"; fi \
 && if [ -n "${prettier_eslint}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "prettier-eslint-cli@${prettier_eslint}"; fi \
 && if [ -n "${prettier_java}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "prettier-plugin-java@${prettier_java}" "prettier@${_yarn_prettier}"; fi \
 && if [ -n "${prettier_php}" ]; then apk add --no-cache "git${_apk_git}" "yarn${_apk_yarn}" \
 && yarn global add "@prettier/plugin-php@${prettier_php}" "prettier@${_yarn_prettier}"; fi \
 && if [ -n "${prettier_ruby}" ]; then apk add --no-cache "ruby-full${_apk_ruby_full}" "yarn${_apk_yarn}" \
 && yarn global add "@prettier/plugin-ruby@${prettier_ruby}" "prettier@${_yarn_prettier}"; fi \
 && if [ -n "${prettier_toml}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "prettier-plugin-toml@${prettier_toml}" "prettier@${_yarn_prettier}"; fi \
 && if [ -n "${prettier_xml}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "@prettier/plugin-xml@${prettier_xml}" "prettier@${_yarn_prettier}"; fi \
 && if [ -n "${pyflakes}" ]; then apk add --no-cache "py3-pip${_apk_py3_pip}" \
 && pip install --no-cache-dir "pyflakes==${pyflakes}"; fi \
 && if [ -n "${pylint}" ]; then apk add --no-cache "py3-pip${_apk_py3_pip}"; fi \
 && if [ -n "${repolinter}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "repolinter@${repolinter}"; fi \
 && if [ -n "${rubocop}" ]; then apk add --no-cache "build-base${_apk_build_base}" "ruby-dev${_apk_ruby_dev}" "ruby-full${_apk_ruby_full}" \
 && gem install --no-document "rubocop:${rubocop}"; fi \
 && if [ -n "${scalafmt}" ]; then apk add --no-cache "openjdk11-jre-headless${_apk_openjdk11_jre_headless}" \
 && coursier_executable="$(mktemp)" \
 && wget --no-verbose --output-document "${coursier_executable}" "https://github.com/coursier/coursier/releases/download/v${_coursier}/coursier" \
 && chmod +x "${coursier_executable}" \
 && "${coursier_executable}" bootstrap "org.scalameta:scalafmt-cli_2.12:${scalafmt}" --main org.scalafmt.cli.Cli --output /usr/local/bin/scalafmt --repository sonatype:snapshots --standalone \
 && rm "${coursier_executable}"; fi \
 && if [ -n "${shellcheck}" ]; then mkdir /opt/shellcheck \
 && wget --no-verbose --output-document - "https://github.com/koalaman/shellcheck/releases/download/v${shellcheck}/shellcheck-v${shellcheck}.linux.x86_64.tar.xz" | tar --directory /opt/shellcheck --extract --file - --strip-components 1 --xz \
 && ln -s /opt/shellcheck/shellcheck /usr/local/bin/shellcheck; fi \
 && if [ -n "${shfmt}" ]; then wget --no-verbose --output-document /usr/local/bin/shfmt "https://github.com/mvdan/sh/releases/download/v${shfmt}/shfmt_v${shfmt}_linux_386" \
 && chmod +x /usr/local/bin/shfmt; fi \
 && if [ -n "${spotbugs}" ]; then apk add --no-cache "openjdk11-jre-headless${_apk_openjdk11_jre_headless}" \
 && mkdir /opt/spotbugs \
 && wget --no-verbose --output-document - "https://repo.maven.apache.org/maven2/com/github/spotbugs/spotbugs/${spotbugs}/spotbugs-${spotbugs}.tgz" | tar --directory /opt/spotbugs --extract --file - --gzip --strip-components 1 \
 && chmod +x /opt/spotbugs/bin/spotbugs \
 && ln -s /opt/spotbugs/bin/spotbugs /usr/local/bin/spotbugs; fi \
 && if [ -n "${standard}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "standard@${standard}"; fi \
 && if [ -n "${stylelint}" ]; then apk add --no-cache "npm${_apk_npm}" \
 && npm install --global "stylelint-config-recommended-scss@${_yarn_stylelint_config_recommended_scss}" "stylelint-config-recommended@${_yarn_stylelint_config_recommended}" "stylelint-config-standard@${_yarn_stylelint_config_standard}" "stylelint@${stylelint}"; fi \
 && if [ -n "${tidy}" ]; then apk add --no-cache "tidyhtml~=${tidy}"; fi \
 && if [ -n "${tslint}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "tslint@${tslint}" "typescript@${_yarn_typescript}"; fi \
 && if [ -n "${vnu}" ]; then apk add --no-cache "openjdk11-jre-headless${_apk_openjdk11_jre_headless}" "yarn${_apk_yarn}" \
 && yarn global add "vnu-jar@${vnu}" \
 && printf '#!/bin/sh\n\njava -jar %s "$@"\n' '/usr/local/share/.config/yarn/global/node_modules/vnu-jar/build/dist/vnu.jar' > /usr/local/bin/vnu \
 && chmod +x /usr/local/bin/vnu; fi \
 && if [ -n "${wemake_python_styleguide}" ]; then apk add --no-cache "py3-pip${_apk_py3_pip}" \
 && pip install --no-cache-dir "wemake-python-styleguide==${wemake_python_styleguide}"; fi \
 && if [ -n "${xmllint}" ]; then apk add --no-cache "libxml2-utils~=${xmllint}"; fi \
 && if [ -n "${xo}" ]; then apk add --no-cache "yarn${_apk_yarn}" \
 && yarn global add "xo@${xo}"; fi \
 && if [ -n "${yamllint}" ]; then apk add --no-cache "py3-pip${_apk_py3_pip}" \
 && pip install --no-cache-dir "yamllint==${yamllint}"; fi \
 && if [ -n "${yapf}" ]; then apk add --no-cache "py3-pip${_apk_py3_pip}" \
 && pip install --no-cache-dir "yapf==${yapf}"; fi
COPY --from=black /opt/black* /var/empty /opt/black/
COPY --from=clang_tidy /usr/local/bin/clang-tidy* /var/empty /usr/local/bin/
COPY --from=hindent /usr/local/bin/hindent* /var/empty /usr/local/bin/
COPY --from=pylint /opt/pylint* /var/empty /opt/pylint/
WORKDIR /workdir
ENV PATH="${PATH}:/opt/black/bin" \
    PYTHONPATH="${PYTHONPATH}:/opt/black"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/lib:/usr/lib"
ENV PATH="${PATH}:/opt/pylint/bin" \
    PYTHONPATH="${PYTHONPATH}:/opt/pylint"
WORKDIR /workdir

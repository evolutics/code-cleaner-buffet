ARG _alpine='3.10.2'
ARG git=''
ARG gitlint=''
ARG hadolint=''
ARG hunspell=''

FROM alpine:"${_alpine}"

ARG git
ARG gitlint
ARG gitlint_git='2.22.0-r0'
ARG gitlint_python3='3.7.5-r0'
ARG hadolint
ARG hadolint_curl='7.66.0-r0'
ARG hunspell
ARG hunspell_hunspell_en='2018.04.16-r0'
RUN if [ -n "${git}" ]; then \
    apk add --no-cache \
      "git==${git}" \
  ; fi \
  && if [ -n "${gitlint}" ]; then \
    apk add --no-cache \
      "git==${gitlint_git}" \
      "python3==${gitlint_python3}" \
    && pip3 install "gitlint==${gitlint}" \
  ; fi \
  && if [ -n "${hadolint}" ]; then \
    apk add --no-cache \
      "curl==${hadolint_curl}" \
    && curl --fail --location --show-error --silent \
      "https://github.com/hadolint/hadolint/releases/download/v${hadolint}/hadolint-Linux-x86_64" \
      > /usr/local/bin/hadolint \
    && chmod +x /usr/local/bin/hadolint \
  ; fi \
  && if [ -n "${hunspell}" ]; then \
    apk add --no-cache \
      "hunspell==${hunspell}" \
      "hunspell-en==${hunspell_hunspell_en}" \
  ; fi

WORKDIR /workdir

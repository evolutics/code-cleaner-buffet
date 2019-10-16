ARG _alpine='3.10.2'
ARG git=''
ARG hadolint=''
ARG hunspell=''

FROM alpine:"${_alpine}"

ARG git
ARG hadolint
ARG hadolint_curl='7.66.0-r0'
ARG hunspell
ARG hunspell_hunspell_en='2018.04.16-r0'
RUN if [ -n "${git}" ]; then \
    apk add --no-cache \
      "git==${git}" \
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

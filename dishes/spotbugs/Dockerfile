ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_curl='7.66.0'
ARG _apk_openjdk11_jre_headless='11.0.4'
ARG spotbugs

LABEL org.opencontainers.image.title='SpotBugs'
LABEL org.opencontainers.image.url='https://spotbugs.github.io'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Java'
LABEL info.evolutics.buffet.versions-url='https://github.com/spotbugs/spotbugs/releases'

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

RUN apk add --no-cache \
    "curl~=${_apk_curl}" \
    "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}" \
  && mkdir /opt/spotbugs \
  && curl --fail --location --show-error --silent \
    "http://repo.maven.apache.org/maven2/com/github/spotbugs/spotbugs/${spotbugs}/spotbugs-${spotbugs}.tgz" \
    | tar --directory /opt/spotbugs --extract --file - --gzip \
      --strip-components 1 \
  && ln -s /opt/spotbugs/bin/spotbugs /usr/local/bin/spotbugs

WORKDIR /workdir

HEALTHCHECK CMD spotbugs -textui /opt/spotbugs/lib/spotbugs.jar

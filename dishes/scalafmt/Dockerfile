ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG _apk_openjdk11_jre_headless=''
ARG _coursier='2.0.3'
ARG scalafmt

LABEL org.opencontainers.image.title='Scalafmt'
LABEL org.opencontainers.image.url='http://scalameta.org/scalafmt'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Scala'
LABEL info.evolutics.buffet.versions-url='https://oss.sonatype.org/content/repositories/snapshots/org/scalameta/scalafmt-cli_2.12/'
LABEL info.evolutics.buffet.version-example='2.7.4'

RUN apk add --no-cache \
    "openjdk11-jre-headless${_apk_openjdk11_jre_headless}" \
  && coursier_executable="$(mktemp)" \
  && wget --no-verbose --output-document "${coursier_executable}" \
    "https://github.com/coursier/coursier/releases/download/v${_coursier}/coursier" \
  && chmod +x "${coursier_executable}" \
  && "${coursier_executable}" bootstrap "org.scalameta:scalafmt-cli_2.12:${scalafmt}" \
    --main org.scalafmt.cli.Cli --output /usr/local/bin/scalafmt \
    --repository sonatype:snapshots --standalone \
  && rm "${coursier_executable}"

WORKDIR /workdir

HEALTHCHECK CMD scalafmt --version \
  && echo 'object Main { println ("Hi") }' | scalafmt --stdin

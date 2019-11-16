ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_openjdk11_jre_headless='11.0.4'
ARG _coursier='1.1.0-M14-7'
ARG scalafmt

LABEL org.opencontainers.image.title='Scalafmt'
LABEL org.opencontainers.image.url='http://scalameta.org/scalafmt'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Scala'
LABEL info.evolutics.buffet.versions-url='https://oss.sonatype.org/content/repositories/snapshots/org/scalameta/scalafmt-cli_2.12/'

RUN apk add --no-cache \
    "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}" \
  && wget --directory-prefix /tmp \
    "https://github.com/coursier/coursier/releases/download/v${_coursier}/coursier" \
  && chmod +x /tmp/coursier \
  && /tmp/coursier bootstrap "org.scalameta:scalafmt-cli_2.12:${scalafmt}" \
    --main org.scalafmt.cli.Cli --output /usr/local/bin/scalafmt \
    --repository sonatype:snapshots --standalone \
  && rm /tmp/coursier

WORKDIR /workdir

HEALTHCHECK CMD echo 'object Main { println ("Hi") }' | scalafmt --stdin
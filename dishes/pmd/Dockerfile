ARG _alpine='3.11.0'

FROM alpine:"${_alpine}"
ARG _apk_bash=''
ARG _apk_openjdk11_jre_headless=''
ARG pmd

LABEL org.opencontainers.image.title='PMD'
LABEL org.opencontainers.image.url='https://pmd.github.io'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Apache Velocity,C,C#,C++,Fortran,Go,Groovy,Java,JavaScript,MATLAB,Objective-C,PHP,PL/SQL,Python,Ruby,Scala,Swift,XML,XSL'
LABEL info.evolutics.buffet.versions-url='https://github.com/pmd/pmd/releases'
LABEL info.evolutics.buffet.version-example='6.20.0'

RUN apk add --no-cache \
    "bash${_apk_bash}" \
    "openjdk11-jre-headless${_apk_openjdk11_jre_headless}" \
  && tmp="$(mktemp -d)" \
  && wget --output-document "${tmp}/pmd.zip" \
    "https://github.com/pmd/pmd/releases/download/pmd_releases%2F${pmd}/pmd-bin-${pmd}.zip" \
  && unzip -d "${tmp}" "${tmp}/pmd.zip" \
  && mv "${tmp}/pmd-bin-${pmd}" /opt/pmd \
  && rm -fr "${tmp}" \
  && ln -s /opt/pmd/bin/run.sh /usr/local/bin/pmd

WORKDIR /workdir

HEALTHCHECK CMD pmd pmd -help \
  && mkdir foo \
  && printf 'package foo;\nclass Bar {}\n' > foo/Bar.java \
  && pmd pmd -dir . -rulesets rulesets/java/quickstart.xml

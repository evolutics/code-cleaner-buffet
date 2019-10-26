ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_bash='5.0.0'
ARG _apk_openjdk11_jre_headless='11.0.4'
ARG pmd

LABEL org.opencontainers.image.title='PMD'
LABEL org.opencontainers.image.url='https://pmd.github.io'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Apache Velocity,C,C#,C++,Fortran,Go,Groovy,Java,JavaScript,MATLAB,Objective-C,PHP,PL/SQL,Python,Ruby,Scala,Swift,XML,XSL'
LABEL info.evolutics.buffet.versions-url='https://github.com/pmd/pmd/releases'

RUN apk add --no-cache \
    "bash~=${_apk_bash}" \
    "openjdk11-jre-headless~=${_apk_openjdk11_jre_headless}" \
  && wget --output-document /tmp/pmd.zip \
    "https://github.com/pmd/pmd/releases/download/pmd_releases%2F${pmd}/pmd-bin-${pmd}.zip" \
  && unzip -d /opt /tmp/pmd.zip \
  && rm /tmp/pmd.zip \
  && mv "/opt/pmd-bin-${pmd}" /opt/pmd \
  && ln -s /opt/pmd/bin/run.sh /usr/local/bin/pmd

WORKDIR /workdir

HEALTHCHECK CMD mkdir foo \
  && printf 'package foo;\nclass Bar {}\n' > foo/Bar.java \
  && pmd pmd -dir . -rulesets rulesets/java/quickstart.xml

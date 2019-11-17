ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG _yarn_typescript='3.7.2'
ARG tslint

LABEL org.opencontainers.image.title='TSLint'
LABEL org.opencontainers.image.url='https://palantir.github.io/tslint/'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='TypeScript'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/tslint'
LABEL info.evolutics.buffet.version-example='5.20.1'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add \
    "tslint@${tslint}" \
    "typescript@${_yarn_typescript}"

WORKDIR /workdir

HEALTHCHECK CMD tslint --version \
  && tslint --init \
  && echo 'const foo = "bar";' > main.ts \
  && tslint '*.ts'

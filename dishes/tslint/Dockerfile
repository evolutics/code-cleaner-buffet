ARG _alpine='3.11.3'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG _yarn_typescript='3.7.4'
ARG tslint

LABEL org.opencontainers.image.title='TSLint'
LABEL org.opencontainers.image.url='https://palantir.github.io/tslint/'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='TypeScript'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/tslint'
LABEL info.evolutics.buffet.version-example='6.0.0'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add \
    "tslint@${tslint}" \
    "typescript@${_yarn_typescript}"

WORKDIR /workdir

HEALTHCHECK CMD tslint --version \
  && tslint --init \
  && echo 'const foo = "bar";' > main.ts \
  && tslint '*.ts'

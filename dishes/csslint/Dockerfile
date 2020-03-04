ARG _alpine='3.11.0'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG csslint

LABEL org.opencontainers.image.title='CSSLint'
LABEL org.opencontainers.image.url='https://github.com/CSSLint/csslint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='CSS'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/csslint'
LABEL info.evolutics.buffet.version-example='1.0.5'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add "csslint@${csslint}"

WORKDIR /workdir

HEALTHCHECK CMD csslint --version \
  && echo '.a { display: none; }' > main.css \
  && csslint main.css

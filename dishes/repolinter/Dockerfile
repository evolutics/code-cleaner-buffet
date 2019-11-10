ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG repolinter

LABEL org.opencontainers.image.title='Repo Linter'
LABEL org.opencontainers.image.url='https://github.com/todogroup/repolinter'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages=''
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/repolinter#changelog'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add "repolinter@${repolinter}"

WORKDIR /workdir

HEALTHCHECK CMD echo \
    '{ "rules": { "all": { "license-detectable-by-licensee": ["info"] } } }' \
    > repolint.json \
  && repolinter

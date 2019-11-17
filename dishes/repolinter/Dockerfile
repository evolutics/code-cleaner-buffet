ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG repolinter

LABEL org.opencontainers.image.title='Repo Linter'
LABEL org.opencontainers.image.url='https://github.com/todogroup/repolinter'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages=''
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/repolinter'
LABEL info.evolutics.buffet.version-example='0.7.0'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add "repolinter@${repolinter}"

WORKDIR /workdir

HEALTHCHECK CMD echo 'No version or help.' \
  && echo \
    '{ "rules": { "all": { "license-detectable-by-licensee": ["info"] } } }' \
    > repolint.json \
  && repolinter

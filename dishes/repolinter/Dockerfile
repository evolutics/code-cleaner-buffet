ARG _alpine='3.12.0'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG repolinter

LABEL org.opencontainers.image.title='Repo Linter'
LABEL org.opencontainers.image.url='https://github.com/todogroup/repolinter'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages=''
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/repolinter'
LABEL info.evolutics.buffet.version-example='0.9.0'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add "repolinter@${repolinter}"

WORKDIR /workdir

HEALTHCHECK CMD echo 'No version or help.' \
  && echo '{ "version": 2, "axioms": {}, "rules": {} }' > repolint.json \
  && repolinter lint

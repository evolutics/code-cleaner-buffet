ARG _alpine='3.11.0'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.19.2'
ARG eslint

LABEL org.opencontainers.image.title='ESLint'
LABEL org.opencontainers.image.url='https://eslint.org'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='JavaScript,JSX'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/eslint'
LABEL info.evolutics.buffet.version-example='6.8.0'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add "eslint@${eslint}"

WORKDIR /workdir

HEALTHCHECK CMD eslint --version \
  && echo '{ "rules": { "semi": ["error", "always"] } }' > .eslintrc \
  && echo 'var foo = "bar";' | eslint --stdin

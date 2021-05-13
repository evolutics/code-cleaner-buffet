ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG _apk_yarn=''
ARG eslint

LABEL org.opencontainers.image.title='ESLint'
LABEL org.opencontainers.image.url='https://eslint.org'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='JavaScript,JSX'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/eslint'
LABEL info.evolutics.buffet.version-example='7.11.0'

RUN apk add --no-cache "yarn${_apk_yarn}" \
  && yarn global add "eslint@${eslint}"

WORKDIR /workdir

HEALTHCHECK CMD eslint --version \
  && echo '{ "rules": { "semi": ["error", "always"] } }' > .eslintrc \
  && echo 'var foo = "bar";' | eslint --stdin

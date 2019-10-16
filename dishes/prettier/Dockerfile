ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG prettier
ARG prettier_yarn='1.16.0-r0'

LABEL org.opencontainers.image.title='Prettier'
LABEL org.opencontainers.image.url='https://prettier.io'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='CSS,Flow,GraphQL,HTML,JavaScript,JSON,JSX,Markdown,TypeScript,YAML'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/prettier#changelog'

RUN apk add --no-cache \
    "yarn==${prettier_yarn}" \
  && yarn global add "prettier@${prettier}"

WORKDIR /workdir

HEALTHCHECK CMD echo '.a { display: none; }' | prettier --stdin-filepath b.css
ARG _alpine='3.12.0'

FROM alpine:"${_alpine}"
ARG _apk_ruby_full=''
ARG _apk_yarn=''
ARG _yarn_prettier='2.1.2'
ARG prettier_ruby

LABEL org.opencontainers.image.title='Prettier Ruby Plugin'
LABEL org.opencontainers.image.url='https://github.com/prettier/plugin-ruby'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Ruby'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/package/@prettier/plugin-ruby'
LABEL info.evolutics.buffet.version-example='0.20.1'

RUN apk add --no-cache \
    "ruby-full${_apk_ruby_full}" \
    "yarn${_apk_yarn}" \
  && yarn global add \
    "@prettier/plugin-ruby@${prettier_ruby}" \
    "prettier@${_yarn_prettier}"

WORKDIR /workdir

HEALTHCHECK CMD prettier --version \
  && echo 'puts "Hi"' | prettier --stdin-filepath main.rb

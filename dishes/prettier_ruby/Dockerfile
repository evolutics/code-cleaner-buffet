ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_ruby_full='2.5.7'
ARG _apk_yarn='1.16.0'
ARG _yarn_prettier='1.19.1'
ARG prettier_ruby

LABEL org.opencontainers.image.title='Prettier Ruby Plugin'
LABEL org.opencontainers.image.url='https://github.com/prettier/plugin-ruby'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Ruby'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/@prettier/plugin-ruby#changelog'

RUN apk add --no-cache \
    "ruby-full~=${_apk_ruby_full}" \
    "yarn~=${_apk_yarn}" \
  && yarn global add \
    "@prettier/plugin-ruby@${prettier_ruby}" \
    "prettier@${_yarn_prettier}"

WORKDIR /workdir

HEALTHCHECK CMD echo 'puts "Hi"' | prettier --stdin-filepath main.rb

ARG _alpine='3.11.0'

FROM alpine:"${_alpine}"
ARG _apk_build_base='0.5'
ARG _apk_ruby_dev='2.6.5'
ARG _apk_ruby_full='2.6.5'
ARG rubocop

LABEL org.opencontainers.image.title='RuboCop'
LABEL org.opencontainers.image.url='https://docs.rubocop.org'
LABEL info.evolutics.buffet.categories='Formatter,Linter'
LABEL info.evolutics.buffet.languages='Ruby'
LABEL info.evolutics.buffet.versions-url='https://rubygems.org/gems/rubocop'
LABEL info.evolutics.buffet.version-example='0.78.0'

RUN apk add --no-cache \
    "build-base~=${_apk_build_base}" \
    "ruby-dev~=${_apk_ruby_dev}" \
    "ruby-full~=${_apk_ruby_full}" \
  && gem install --no-document "rubocop:${rubocop}"

WORKDIR /workdir

HEALTHCHECK CMD rubocop --version \
  && printf "# frozen_string_literal: true\n\nputs 'Hi'\n" > main.rb \
  && rubocop

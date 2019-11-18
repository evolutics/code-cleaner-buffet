ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG mix

LABEL org.opencontainers.image.title='Mix'
LABEL org.opencontainers.image.url='https://hexdocs.pm/mix/'
LABEL info.evolutics.buffet.categories='Formatter,Linter'
LABEL info.evolutics.buffet.languages='Elixir'
LABEL info.evolutics.buffet.versions-url='https://pkgs.alpinelinux.org/packages?name=elixir&branch=v3.10'
LABEL info.evolutics.buffet.version-example='1.8.2'

RUN apk add --no-cache "elixir~=${mix}"

WORKDIR /workdir

HEALTHCHECK CMD mix --version \
  && echo 'defmodule Main do def main do IO.puts "Hi" end end' | mix format -

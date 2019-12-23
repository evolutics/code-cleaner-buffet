ARG _alpine='3.11.0'

FROM alpine:"${_alpine}"
ARG _apk_git='2.24.1'
ARG _apk_yarn='1.19.2'
ARG luafmt

LABEL org.opencontainers.image.title='lua-fmt'
LABEL org.opencontainers.image.url='https://github.com/trixnz/lua-fmt'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Lua'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/lua-fmt'
LABEL info.evolutics.buffet.version-example='2.6.0'

RUN apk add --no-cache \
    "git~=${_apk_git}" \
    "yarn~=${_apk_yarn}" \
  && yarn global add "lua-fmt@${luafmt}"

WORKDIR /workdir

HEALTHCHECK CMD luafmt --version \
  && echo 'print ("Hi")' | luafmt --stdin

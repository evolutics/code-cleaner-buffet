ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG _apk_python3='3.7.5'
ARG cpplint

LABEL org.opencontainers.image.title='cpplint'
LABEL org.opencontainers.image.url='https://github.com/cpplint/cpplint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='C,C++'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/cpplint/'
LABEL info.evolutics.buffet.version-example='1.4.4'

RUN apk add --no-cache "python3~=${_apk_python3}" \
  && pip3 install "cpplint==${cpplint}"

WORKDIR /workdir

HEALTHCHECK CMD \
  printf '// Copyright 2019 Boo Far\n#include <iostream>\nint main() { }\n' \
    > main.cpp \
  && cpplint main.cpp

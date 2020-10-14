ARG _alpine='3.11.5'

FROM alpine:"${_alpine}"
ARG _apk_python3=''
ARG cpplint

LABEL org.opencontainers.image.title='cpplint'
LABEL org.opencontainers.image.url='https://github.com/cpplint/cpplint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='C,C++'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/cpplint/'
LABEL info.evolutics.buffet.version-example='1.4.5'

RUN apk add --no-cache "python3${_apk_python3}" \
  && pip3 install "cpplint==${cpplint}"

WORKDIR /workdir

HEALTHCHECK CMD cpplint --version \
  && printf '// Copyright Boo Far\n#include <iostream>\nint main() { }\n' \
    > main.cpp \
  && cpplint main.cpp

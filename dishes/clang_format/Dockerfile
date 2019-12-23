ARG _alpine='3.11.0'

FROM alpine:"${_alpine}"
ARG clang_format

LABEL org.opencontainers.image.title='ClangFormat'
LABEL org.opencontainers.image.url='https://clang.llvm.org/docs/ClangFormat.html'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='C,C#,C++,Java,JavaScript,Objective-C,Protocol buffers'
LABEL info.evolutics.buffet.versions-url='https://pkgs.alpinelinux.org/packages?name=clang&branch=v3.11'
LABEL info.evolutics.buffet.version-example='9.0.0'

RUN apk add --no-cache "clang~=${clang_format}"

WORKDIR /workdir

HEALTHCHECK CMD clang-format -version \
  && printf '#include <stdio.h> \nint main(void) { printf ("Hi\\n"); }\n' \
    | clang-format

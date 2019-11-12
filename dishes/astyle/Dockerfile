ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG astyle

LABEL org.opencontainers.image.title='Artistic Style'
LABEL org.opencontainers.image.url='http://astyle.sourceforge.net'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='C,C#,C++,Java,Objective‑C'
LABEL info.evolutics.buffet.versions-url='https://pkgs.alpinelinux.org/packages?name=astyle&branch=v3.10'

RUN apk add --no-cache "astyle~=${astyle}"

WORKDIR /workdir

HEALTHCHECK CMD \
  echo 'class Main { public static void Main(string[] args) { } }' > Main.cs \
  && astyle Main.cs

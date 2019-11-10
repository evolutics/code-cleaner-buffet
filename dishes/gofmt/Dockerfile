ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG gofmt

LABEL org.opencontainers.image.title='gofmt'
LABEL org.opencontainers.image.url='https://golang.org/cmd/gofmt/'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='Go'
LABEL info.evolutics.buffet.versions-url='https://golang.org/dl/'

SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN wget --output-document - \
    "https://dl.google.com/go/go${gofmt}.linux-amd64.tar.gz" \
    | tar --directory /usr/local/bin --extract --file - --gzip \
    --strip-components 2 go/bin/gofmt

WORKDIR /workdir

HEALTHCHECK CMD \
  printf 'package main\nimport  "fmt"\nfunc main() { fmt.Println ("Hi") }\n' \
  | gofmt

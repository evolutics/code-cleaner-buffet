ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG _apk_go=''
ARG golangci_lint

LABEL org.opencontainers.image.title='GolangCI-Lint'
LABEL org.opencontainers.image.url='https://github.com/golangci/golangci-lint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Go'
LABEL info.evolutics.buffet.versions-url='https://github.com/golangci/golangci-lint/releases'
LABEL info.evolutics.buffet.version-example='1.31.0'

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

RUN apk add --no-cache "go${_apk_go}" \
  && wget --no-verbose --output-document - \
    https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh \
    | sh -s "v${golangci_lint}"

WORKDIR /workdir

HEALTHCHECK CMD golangci-lint --version \
  && printf 'package main\nimport "fmt"\nfunc main() { fmt.Println("Hi") }\n' \
    > main.go \
  && golangci-lint run

ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
ARG _apk_build_base='0.5'
ARG _apk_cmake='3.14.5'
ARG _apk_ninja='1.9.0'
ARG _apk_python3='3.7.5'
ARG clang_tidy

LABEL org.opencontainers.image.title='clang-tidy'
LABEL org.opencontainers.image.url='https://clang.llvm.org/extra/clang-tidy/'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='C,C++'
LABEL info.evolutics.buffet.versions-url='http://releases.llvm.org'
LABEL info.evolutics.buffet.version-example='9.0.0'

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3003
RUN apk add --no-cache \
    "build-base~=${_apk_build_base}" \
    "cmake~=${_apk_cmake}" \
    "ninja~=${_apk_ninja}" \
    "python3~=${_apk_python3}" \
  && tmp="$(mktemp -d)" \
  && mkdir "${tmp}/llvm" \
  && wget --output-document - \
    "http://releases.llvm.org/${clang_tidy}/llvm-${clang_tidy}.src.tar.xz" \
    | tar --directory "${tmp}/llvm" --extract --file - --strip-components 1 \
      --xz \
  && wget --output-document - \
    "http://releases.llvm.org/${clang_tidy}/cfe-${clang_tidy}.src.tar.xz" \
    | tar --directory "${tmp}/llvm/tools" --extract --file - --xz \
  && mkdir "${tmp}/llvm/tools/cfe-${clang_tidy}.src/tools/extra" \
  && wget --output-document - \
    "http://releases.llvm.org/${clang_tidy}/clang-tools-extra-${clang_tidy}.src.tar.xz" \
    | tar --directory "${tmp}/llvm/tools/cfe-${clang_tidy}.src/tools/extra" \
      --extract --file - --strip-components 1 --xz \
  && mkdir "${tmp}/build" \
  && cd "${tmp}/build" \
  && cmake -G Ninja ../llvm \
  && ninja clang-tidy \
  && mv "${tmp}/build/bin/clang-tidy" /usr/local/bin \
  && rm -fr "${tmp}"

WORKDIR /workdir

HEALTHCHECK CMD clang-tidy --version \
  && echo 'int main(int argc, char *argv[]) { return argc; }' > main.cpp \
  && clang-tidy main.cpp -- -I.
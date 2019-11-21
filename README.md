# Code Cleaner Buffet 🍜

[![Build](https://img.shields.io/travis/evolutics/code-cleaner-buffet.svg)](https://travis-ci.org/evolutics/code-cleaner-buffet)

## Index

[`addons_linter`](#addons_linter)&emsp;
[`aspell`](#aspell)&emsp;
[`astyle`](#astyle)&emsp;
[`black`](#black)&emsp;
[`bootlint`](#bootlint)&emsp;
[`brittany`](#brittany)&emsp;
[`clang_format`](#clang_format)&emsp;
[`clang_tidy`](#clang_tidy)&emsp;
[`cpplint`](#cpplint)&emsp;
[`csscomb`](#csscomb)&emsp;
[`csslint`](#csslint)&emsp;
[`doiuse`](#doiuse)&emsp;
[`eslint`](#eslint)&emsp;
[`git`](#git)&emsp;
[`gitlint`](#gitlint)&emsp;
[`gofmt`](#gofmt)&emsp;
[`golangci_lint`](#golangci_lint)&emsp;
[`google_java_format`](#google_java_format)&emsp;
[`hadolint`](#hadolint)&emsp;
[`hindent`](#hindent)&emsp;
[`hlint`](#hlint)&emsp;
[`htmllint`](#htmllint)&emsp;
[`hunspell`](#hunspell)&emsp;
[`jsonlint`](#jsonlint)&emsp;
[`ktlint`](#ktlint)&emsp;
[`luafmt`](#luafmt)&emsp;
[`mix`](#mix)&emsp;
[`phplint`](#phplint)&emsp;
[`pmd`](#pmd)&emsp;
[`prettier`](#prettier)&emsp;
[`prettier_eslint`](#prettier_eslint)&emsp;
[`prettier_java`](#prettier_java)&emsp;
[`prettier_php`](#prettier_php)&emsp;
[`prettier_ruby`](#prettier_ruby)&emsp;
[`prettier_toml`](#prettier_toml)&emsp;
[`prettier_xml`](#prettier_xml)&emsp;
[`pyflakes`](#pyflakes)&emsp;
[`pylint`](#pylint)&emsp;
[`repolinter`](#repolinter)&emsp;
[`rubocop`](#rubocop)&emsp;
[`scalafmt`](#scalafmt)&emsp;
[`shellcheck`](#shellcheck)&emsp;
[`spotbugs`](#spotbugs)&emsp;
[`standard`](#standard)&emsp;
[`stylelint`](#stylelint)&emsp;
[`tidy`](#tidy)&emsp;
[`tslint`](#tslint)&emsp;
[`vnu`](#vnu)&emsp;
[`wemake_python_styleguide`](#wemake_python_styleguide)&emsp;
[`xmllint`](#xmllint)&emsp;
[`xo`](#xo)&emsp;
[`yamllint`](#yamllint)&emsp;
[`yapf`](#yapf)&emsp;

### By category

- Formatter:
  &emsp;[`astyle`](#astyle)
  &emsp;[`black`](#black)
  &emsp;[`brittany`](#brittany)
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`csscomb`](#csscomb)
  &emsp;[`gofmt`](#gofmt)
  &emsp;[`google_java_format`](#google_java_format)
  &emsp;[`hindent`](#hindent)
  &emsp;[`ktlint`](#ktlint)
  &emsp;[`luafmt`](#luafmt)
  &emsp;[`mix`](#mix)
  &emsp;[`prettier`](#prettier)
  &emsp;[`prettier_eslint`](#prettier_eslint)
  &emsp;[`prettier_java`](#prettier_java)
  &emsp;[`prettier_php`](#prettier_php)
  &emsp;[`prettier_ruby`](#prettier_ruby)
  &emsp;[`prettier_toml`](#prettier_toml)
  &emsp;[`prettier_xml`](#prettier_xml)
  &emsp;[`rubocop`](#rubocop)
  &emsp;[`scalafmt`](#scalafmt)
  &emsp;[`standard`](#standard)
  &emsp;[`tidy`](#tidy)
  &emsp;[`xmllint`](#xmllint)
  &emsp;[`xo`](#xo)
  &emsp;[`yapf`](#yapf)
- Linter:
  &emsp;[`addons_linter`](#addons_linter)
  &emsp;[`bootlint`](#bootlint)
  &emsp;[`clang_tidy`](#clang_tidy)
  &emsp;[`cpplint`](#cpplint)
  &emsp;[`csscomb`](#csscomb)
  &emsp;[`csslint`](#csslint)
  &emsp;[`doiuse`](#doiuse)
  &emsp;[`eslint`](#eslint)
  &emsp;[`git`](#git)
  &emsp;[`gitlint`](#gitlint)
  &emsp;[`golangci_lint`](#golangci_lint)
  &emsp;[`hadolint`](#hadolint)
  &emsp;[`hlint`](#hlint)
  &emsp;[`htmllint`](#htmllint)
  &emsp;[`jsonlint`](#jsonlint)
  &emsp;[`ktlint`](#ktlint)
  &emsp;[`mix`](#mix)
  &emsp;[`phplint`](#phplint)
  &emsp;[`pmd`](#pmd)
  &emsp;[`prettier_eslint`](#prettier_eslint)
  &emsp;[`pyflakes`](#pyflakes)
  &emsp;[`pylint`](#pylint)
  &emsp;[`repolinter`](#repolinter)
  &emsp;[`rubocop`](#rubocop)
  &emsp;[`shellcheck`](#shellcheck)
  &emsp;[`spotbugs`](#spotbugs)
  &emsp;[`standard`](#standard)
  &emsp;[`stylelint`](#stylelint)
  &emsp;[`tidy`](#tidy)
  &emsp;[`tslint`](#tslint)
  &emsp;[`vnu`](#vnu)
  &emsp;[`wemake_python_styleguide`](#wemake_python_styleguide)
  &emsp;[`xmllint`](#xmllint)
  &emsp;[`xo`](#xo)
  &emsp;[`yamllint`](#yamllint)
- Spell checker:
  &emsp;[`aspell`](#aspell)
  &emsp;[`hunspell`](#hunspell)

### By language

- Apache Velocity:
  &emsp;[`pmd`](#pmd)
- C:
  &emsp;[`astyle`](#astyle)
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`clang_tidy`](#clang_tidy)
  &emsp;[`cpplint`](#cpplint)
  &emsp;[`pmd`](#pmd)
- C#:
  &emsp;[`astyle`](#astyle)
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`pmd`](#pmd)
- C++:
  &emsp;[`astyle`](#astyle)
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`clang_tidy`](#clang_tidy)
  &emsp;[`cpplint`](#cpplint)
  &emsp;[`pmd`](#pmd)
- CSS:
  &emsp;[`addons_linter`](#addons_linter)
  &emsp;[`csscomb`](#csscomb)
  &emsp;[`csslint`](#csslint)
  &emsp;[`doiuse`](#doiuse)
  &emsp;[`prettier`](#prettier)
  &emsp;[`stylelint`](#stylelint)
  &emsp;[`vnu`](#vnu)
- Dockerfile:
  &emsp;[`hadolint`](#hadolint)
- Elixir:
  &emsp;[`mix`](#mix)
- Flow:
  &emsp;[`prettier`](#prettier)
- Fortran:
  &emsp;[`pmd`](#pmd)
- Go:
  &emsp;[`gofmt`](#gofmt)
  &emsp;[`golangci_lint`](#golangci_lint)
  &emsp;[`pmd`](#pmd)
- GraphQL:
  &emsp;[`prettier`](#prettier)
- Groovy:
  &emsp;[`pmd`](#pmd)
- Haskell:
  &emsp;[`brittany`](#brittany)
  &emsp;[`hindent`](#hindent)
  &emsp;[`hlint`](#hlint)
- HTML:
  &emsp;[`addons_linter`](#addons_linter)
  &emsp;[`bootlint`](#bootlint)
  &emsp;[`htmllint`](#htmllint)
  &emsp;[`prettier`](#prettier)
  &emsp;[`tidy`](#tidy)
  &emsp;[`vnu`](#vnu)
- Java:
  &emsp;[`astyle`](#astyle)
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`google_java_format`](#google_java_format)
  &emsp;[`pmd`](#pmd)
  &emsp;[`prettier_java`](#prettier_java)
  &emsp;[`spotbugs`](#spotbugs)
- JavaScript:
  &emsp;[`addons_linter`](#addons_linter)
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`eslint`](#eslint)
  &emsp;[`pmd`](#pmd)
  &emsp;[`prettier`](#prettier)
  &emsp;[`prettier_eslint`](#prettier_eslint)
  &emsp;[`standard`](#standard)
  &emsp;[`xo`](#xo)
- JSON:
  &emsp;[`jsonlint`](#jsonlint)
  &emsp;[`prettier`](#prettier)
- JSX:
  &emsp;[`eslint`](#eslint)
  &emsp;[`prettier`](#prettier)
  &emsp;[`xo`](#xo)
- Kotlin:
  &emsp;[`ktlint`](#ktlint)
- Lua:
  &emsp;[`luafmt`](#luafmt)
- Markdown:
  &emsp;[`prettier`](#prettier)
- MATLAB:
  &emsp;[`pmd`](#pmd)
- Natural language:
  &emsp;[`aspell`](#aspell)
  &emsp;[`hunspell`](#hunspell)
- Objective-C:
  &emsp;[`astyle`](#astyle)
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`pmd`](#pmd)
- PHP:
  &emsp;[`phplint`](#phplint)
  &emsp;[`pmd`](#pmd)
  &emsp;[`prettier_php`](#prettier_php)
- PL/SQL:
  &emsp;[`pmd`](#pmd)
- Protocol buffers:
  &emsp;[`clang_format`](#clang_format)
- Python:
  &emsp;[`black`](#black)
  &emsp;[`pmd`](#pmd)
  &emsp;[`pyflakes`](#pyflakes)
  &emsp;[`pylint`](#pylint)
  &emsp;[`wemake_python_styleguide`](#wemake_python_styleguide)
  &emsp;[`yapf`](#yapf)
- Ruby:
  &emsp;[`pmd`](#pmd)
  &emsp;[`prettier_ruby`](#prettier_ruby)
  &emsp;[`rubocop`](#rubocop)
- Scala:
  &emsp;[`pmd`](#pmd)
  &emsp;[`scalafmt`](#scalafmt)
- Shell:
  &emsp;[`shellcheck`](#shellcheck)
- SVG:
  &emsp;[`vnu`](#vnu)
- Swift:
  &emsp;[`pmd`](#pmd)
- TOML:
  &emsp;[`prettier_toml`](#prettier_toml)
- TypeScript:
  &emsp;[`prettier`](#prettier)
  &emsp;[`tslint`](#tslint)
- XML:
  &emsp;[`pmd`](#pmd)
  &emsp;[`prettier_xml`](#prettier_xml)
  &emsp;[`tidy`](#tidy)
  &emsp;[`xmllint`](#xmllint)
- XSL:
  &emsp;[`pmd`](#pmd)
- YAML:
  &emsp;[`prettier`](#prettier)
  &emsp;[`yamllint`](#yamllint)

## Dishes

### `addons_linter`

[**Add-ons Linter**](https://github.com/mozilla/addons-linter)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/addons-linter)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;CSS
&emsp;HTML
&emsp;JavaScript

🚀 Quick start:

```bash
docker build \
  --build-arg addons_linter=1.15.1 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
addons-linter --version \
  && echo '{ "manifest_version": 2, "name": "Borderify", "version": "1.0" }' \
    > manifest.json \
  && addons-linter .
```

[… Dockerfile](dishes/addons_linter/Dockerfile)

</details>

### `aspell`

[**GNU Aspell**](http://aspell.net)

<details>

[↻ Available versions](https://pkgs.alpinelinux.org/packages?name=aspell&branch=v3.10)

[🏷 Categories:](#by-category)
&emsp;Spell checker

[📜 Languages:](#by-language)
&emsp;Natural language

🚀 Quick start:

```bash
docker build \
  --build-arg aspell=0.60.6.1 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
aspell --version \
  && echo 'example' | aspell --lang en_US list
```

[… Dockerfile](dishes/aspell/Dockerfile)

</details>

### `astyle`

[**Artistic Style**](http://astyle.sourceforge.net)

<details>

[↻ Available versions](https://pkgs.alpinelinux.org/packages?name=astyle&branch=v3.10)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;C
&emsp;C#
&emsp;C++
&emsp;Java
&emsp;Objective-C

🚀 Quick start:

```bash
docker build \
  --build-arg astyle=3.1 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
astyle --version \
  && echo 'class Main { public static void Main(string[] args) { } }' \
    > Main.cs \
  && astyle Main.cs
```

[… Dockerfile](dishes/astyle/Dockerfile)

</details>

### `black`

[**Black**](https://github.com/psf/black)

<details>

[↻ Available versions](https://pypi.org/project/black/)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Python

🚀 Quick start:

```bash
docker build \
  --build-arg black=19.3b0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
black --version \
  && echo 'j = [1,  2,3]' | black -
```

[… Dockerfile](dishes/black/Dockerfile)

</details>

### `bootlint`

[**Bootlint**](https://github.com/twbs/bootlint)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/bootlint)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;HTML

🚀 Quick start:

```bash
docker build \
  --build-arg bootlint=1.0.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
bootlint --version \
  && echo \
    '<!DOCTYPE html><html><head><meta charset="utf-8"><title>Hi</title></head></html>' \
    | bootlint --disable W002,W003,W005
```

[… Dockerfile](dishes/bootlint/Dockerfile)

</details>

### `brittany`

[**brittany**](https://github.com/lspitzner/brittany)

<details>

[↻ Available versions](https://hackage.haskell.org/package/brittany)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Haskell

🚀 Quick start:

```bash
docker build \
  --build-arg brittany=0.12.1.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
brittany --version \
  && echo 'example = case x of Just p -> foo bar' | brittany
```

[… Dockerfile](dishes/brittany/Dockerfile)

</details>

### `clang_format`

[**ClangFormat**](https://clang.llvm.org/docs/ClangFormat.html)

<details>

[↻ Available versions](https://pkgs.alpinelinux.org/packages?name=clang&branch=v3.10)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;C
&emsp;C#
&emsp;C++
&emsp;Java
&emsp;JavaScript
&emsp;Objective-C
&emsp;Protocol buffers

🚀 Quick start:

```bash
docker build \
  --build-arg clang_format=8.0.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
clang-format -version \
  && printf '#include <stdio.h> \nint main(void) { printf ("Hi\\n"); }\n' \
    | clang-format
```

[… Dockerfile](dishes/clang_format/Dockerfile)

</details>

### `clang_tidy`

[**clang-tidy**](https://clang.llvm.org/extra/clang-tidy/)

<details>

[↻ Available versions](http://releases.llvm.org)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;C
&emsp;C++

🚀 Quick start:

```bash
docker build \
  --build-arg clang_tidy=9.0.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
clang-tidy --version \
  && echo 'int main(int argc, char *argv[]) { return argc; }' > main.cpp \
  && clang-tidy main.cpp -- -I.
```

[… Dockerfile](dishes/clang_tidy/Dockerfile)

</details>

### `cpplint`

[**cpplint**](https://github.com/cpplint/cpplint)

<details>

[↻ Available versions](https://pypi.org/project/cpplint/)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;C
&emsp;C++

🚀 Quick start:

```bash
docker build \
  --build-arg cpplint=1.4.4 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
cpplint --version \
  && printf '// Copyright 2019 Boo Far\n#include <iostream>\nint main() { }\n' \
    > main.cpp \
  && cpplint main.cpp
```

[… Dockerfile](dishes/cpplint/Dockerfile)

</details>

### `csscomb`

[**CSScomb**](https://github.com/csscomb/csscomb.js)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/csscomb)

[🏷 Categories:](#by-category)
&emsp;Formatter
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;CSS

🚀 Quick start:

```bash
docker build \
  --build-arg csscomb=4.3.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
csscomb --help \
  && echo '.a { display: none; }' | csscomb -
```

[… Dockerfile](dishes/csscomb/Dockerfile)

</details>

### `csslint`

[**CSSLint**](https://github.com/CSSLint/csslint)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/csslint)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;CSS

🚀 Quick start:

```bash
docker build \
  --build-arg csslint=1.0.5 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
csslint --version \
  && echo '.a { display: none; }' > main.css \
  && csslint main.css
```

[… Dockerfile](dishes/csslint/Dockerfile)

</details>

### `doiuse`

[**doiuse**](https://github.com/anandthakker/doiuse)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/doiuse)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;CSS

🚀 Quick start:

```bash
docker build \
  --build-arg doiuse=4.2.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
doiuse --version \
  && echo '.a { display: none; }' \
    | doiuse --browsers 'ie >= 9, > 1%, last 2 versions'
```

[… Dockerfile](dishes/doiuse/Dockerfile)

</details>

### `eslint`

[**ESLint**](https://eslint.org)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/eslint)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;JavaScript
&emsp;JSX

🚀 Quick start:

```bash
docker build \
  --build-arg eslint=6.5.1 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
eslint --version \
  && echo '{ "rules": { "semi": ["error", "always"] } }' > .eslintrc \
  && echo 'var foo = "bar";' | eslint --stdin
```

[… Dockerfile](dishes/eslint/Dockerfile)

</details>

### `git`

[**Git**](https://git-scm.com)

<details>

[↻ Available versions](https://pkgs.alpinelinux.org/packages?name=git&branch=v3.10)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;–

🚀 Quick start:

```bash
docker build \
  --build-arg git=2.22.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
git --version \
  && git init \
  && git config user.email me@example.com \
  && touch readme \
  && git add . \
  && git commit -m 'Start readme'
```

[… Dockerfile](dishes/git/Dockerfile)

</details>

### `gitlint`

[**Gitlint**](http://jorisroovers.github.io/gitlint)

<details>

[↻ Available versions](https://pypi.org/project/gitlint/)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;–

🚀 Quick start:

```bash
docker build \
  --build-arg gitlint=0.12.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
gitlint --version \
  && printf 'Change foo\n\nBecause bar is missing.\n' | gitlint
```

[… Dockerfile](dishes/gitlint/Dockerfile)

</details>

### `gofmt`

[**gofmt**](https://golang.org/cmd/gofmt/)

<details>

[↻ Available versions](https://golang.org/dl/)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Go

🚀 Quick start:

```bash
docker build \
  --build-arg gofmt=1.13.4 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
gofmt --help ; [ "$?" -eq 2 ] \
  && printf \
    'package main\nimport  "fmt"\nfunc main() { fmt.Println ("Hi") }\n' \
    | gofmt
```

[… Dockerfile](dishes/gofmt/Dockerfile)

</details>

### `golangci_lint`

[**GolangCI-Lint**](https://github.com/golangci/golangci-lint)

<details>

[↻ Available versions](https://github.com/golangci/golangci-lint/releases)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Go

🚀 Quick start:

```bash
docker build \
  --build-arg golangci_lint=1.21.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
golangci-lint --version \
  && printf 'package main\nimport "fmt"\nfunc main() { fmt.Println("Hi") }\n' \
    > main.go \
  && golangci-lint run
```

[… Dockerfile](dishes/golangci_lint/Dockerfile)

</details>

### `google_java_format`

[**google-java-format**](https://github.com/google/google-java-format)

<details>

[↻ Available versions](https://github.com/google/google-java-format/releases)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Java

🚀 Quick start:

```bash
docker build \
  --build-arg google_java_format=1.7 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
google-java-format --version \
  && echo 'class Foo { void bar() {} }' | google-java-format -
```

[… Dockerfile](dishes/google_java_format/Dockerfile)

</details>

### `hadolint`

[**Haskell Dockerfile Linter**](https://github.com/hadolint/hadolint)

<details>

[↻ Available versions](https://github.com/hadolint/hadolint/releases)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Dockerfile

🚀 Quick start:

```bash
docker build \
  --build-arg hadolint=1.17.2 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
hadolint --version \
  && echo 'FROM foo:bar' | hadolint -
```

[… Dockerfile](dishes/hadolint/Dockerfile)

</details>

### `hindent`

[**hindent**](https://github.com/chrisdone/hindent)

<details>

[↻ Available versions](https://hackage.haskell.org/package/hindent)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Haskell

🚀 Quick start:

```bash
docker build \
  --build-arg hindent=5.3.1 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
hindent --version \
  && echo 'example = case x of Just p -> foo bar' | hindent
```

[… Dockerfile](dishes/hindent/Dockerfile)

</details>

### `hlint`

[**HLint**](https://github.com/ndmitchell/hlint)

<details>

[↻ Available versions](https://hackage.haskell.org/package/hlint)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Haskell

🚀 Quick start:

```bash
docker build \
  --build-arg hlint=2.2.3 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
hlint --version \
  && echo 'foo = fmap . fmap' | hlint -
```

[… Dockerfile](dishes/hlint/Dockerfile)

</details>

### `htmllint`

[**htmllint-cli**](https://github.com/htmllint/htmllint-cli)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/htmllint-cli)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;HTML

🚀 Quick start:

```bash
docker build \
  --build-arg htmllint=0.0.7 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
htmllint --version \
  && htmllint init \
  && echo \
    '<!DOCTYPE html><html><head><meta charset="utf-8"><title>Hi</title></head></html>' \
    > main.html \
  && htmllint
```

[… Dockerfile](dishes/htmllint/Dockerfile)

</details>

### `hunspell`

[**Hunspell**](https://hunspell.github.io)

<details>

[↻ Available versions](https://pkgs.alpinelinux.org/packages?name=hunspell&branch=v3.10)

[🏷 Categories:](#by-category)
&emsp;Spell checker

[📜 Languages:](#by-language)
&emsp;Natural language

🚀 Quick start:

```bash
docker build \
  --build-arg hunspell=1.7.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
hunspell --version \
  && echo 'example' | hunspell -d en_US
```

[… Dockerfile](dishes/hunspell/Dockerfile)

</details>

### `jsonlint`

[**JSON Lint**](https://github.com/zaach/jsonlint)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/jsonlint)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;JSON

🚀 Quick start:

```bash
docker build \
  --build-arg jsonlint=1.6.3 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
jsonlint --version ; [ "$?" -eq 1 ] \
  && echo '{"foo": "bar"}' | jsonlint
```

[… Dockerfile](dishes/jsonlint/Dockerfile)

</details>

### `ktlint`

[**ktlint**](https://ktlint.github.io)

<details>

[↻ Available versions](https://github.com/pinterest/ktlint/releases)

[🏷 Categories:](#by-category)
&emsp;Formatter
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Kotlin

🚀 Quick start:

```bash
docker build \
  --build-arg ktlint=0.35.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
ktlint --version \
  && echo 'fun main () { println("Hi") }' | ktlint --format --stdin
```

[… Dockerfile](dishes/ktlint/Dockerfile)

</details>

### `luafmt`

[**lua-fmt**](https://github.com/trixnz/lua-fmt)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/lua-fmt)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Lua

🚀 Quick start:

```bash
docker build \
  --build-arg luafmt=2.6.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
luafmt --version \
  && echo 'print ("Hi")' | luafmt --stdin
```

[… Dockerfile](dishes/luafmt/Dockerfile)

</details>

### `mix`

[**Mix**](https://hexdocs.pm/mix/)

<details>

[↻ Available versions](https://pkgs.alpinelinux.org/packages?name=elixir&branch=v3.10)

[🏷 Categories:](#by-category)
&emsp;Formatter
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Elixir

🚀 Quick start:

```bash
docker build \
  --build-arg mix=1.8.2 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
mix --version \
  && echo 'defmodule Main do def main do IO.puts "Hi" end end' | mix format -
```

[… Dockerfile](dishes/mix/Dockerfile)

</details>

### `phplint`

[**phplint**](https://github.com/overtrue/phplint)

<details>

[↻ Available versions](https://packagist.org/packages/overtrue/phplint)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;PHP

🚀 Quick start:

```bash
docker build \
  --build-arg phplint=1.1.9 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
phplint --version \
  && echo '<?php echo "Hi"; ?>' > main.php \
  && phplint main.php
```

[… Dockerfile](dishes/phplint/Dockerfile)

</details>

### `pmd`

[**PMD**](https://pmd.github.io)

<details>

[↻ Available versions](https://github.com/pmd/pmd/releases)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Apache Velocity
&emsp;C
&emsp;C#
&emsp;C++
&emsp;Fortran
&emsp;Go
&emsp;Groovy
&emsp;Java
&emsp;JavaScript
&emsp;MATLAB
&emsp;Objective-C
&emsp;PHP
&emsp;PL/SQL
&emsp;Python
&emsp;Ruby
&emsp;Scala
&emsp;Swift
&emsp;XML
&emsp;XSL

🚀 Quick start:

```bash
docker build \
  --build-arg pmd=6.18.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
pmd pmd -help \
  && mkdir foo \
  && printf 'package foo;\nclass Bar {}\n' > foo/Bar.java \
  && pmd pmd -dir . -rulesets rulesets/java/quickstart.xml
```

[… Dockerfile](dishes/pmd/Dockerfile)

</details>

### `prettier`

[**Prettier**](https://prettier.io)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/prettier)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;CSS
&emsp;Flow
&emsp;GraphQL
&emsp;HTML
&emsp;JavaScript
&emsp;JSON
&emsp;JSX
&emsp;Markdown
&emsp;TypeScript
&emsp;YAML

🚀 Quick start:

```bash
docker build \
  --build-arg prettier=1.18.2 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
prettier --version \
  && echo '.a { display: none; }' | prettier --stdin-filepath b.css
```

[… Dockerfile](dishes/prettier/Dockerfile)

</details>

### `prettier_eslint`

[**prettier-eslint**](https://github.com/prettier/prettier-eslint-cli)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/prettier-eslint-cli)

[🏷 Categories:](#by-category)
&emsp;Formatter
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;JavaScript

🚀 Quick start:

```bash
docker build \
  --build-arg prettier_eslint=5.0.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
prettier-eslint --version \
  && echo 'var  foo =  "bar"' | prettier-eslint --stdin --stdin-filepath baz.js
```

[… Dockerfile](dishes/prettier_eslint/Dockerfile)

</details>

### `prettier_java`

[**Prettier Java Plugin**](https://github.com/jhipster/prettier-java)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/prettier-plugin-java)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Java

🚀 Quick start:

```bash
docker build \
  --build-arg prettier_java=0.4.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
prettier --version \
  && echo 'class Foo { void bar() {} }' | prettier --stdin-filepath Foo.java
```

[… Dockerfile](dishes/prettier_java/Dockerfile)

</details>

### `prettier_php`

[**Prettier PHP Plugin**](https://github.com/prettier/plugin-php)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/@prettier/plugin-php)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;PHP

🚀 Quick start:

```bash
docker build \
  --build-arg prettier_php=0.11.2 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
prettier --version \
  && echo '<?php echo "Hi" ; ?>' | prettier --stdin-filepath main.php
```

[… Dockerfile](dishes/prettier_php/Dockerfile)

</details>

### `prettier_ruby`

[**Prettier Ruby Plugin**](https://github.com/prettier/plugin-ruby)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/@prettier/plugin-ruby)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Ruby

🚀 Quick start:

```bash
docker build \
  --build-arg prettier_ruby=0.16.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
prettier --version \
  && echo 'puts "Hi"' | prettier --stdin-filepath main.rb
```

[… Dockerfile](dishes/prettier_ruby/Dockerfile)

</details>

### `prettier_toml`

[**Prettier Toml Plugin**](https://github.com/bd82/toml-tools/tree/master/packages/prettier-plugin-toml)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/prettier-plugin-toml)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;TOML

🚀 Quick start:

```bash
docker build \
  --build-arg prettier_toml=0.3.1 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
prettier --version \
  && echo 'foo  =  "bar"' | prettier --stdin-filepath main.toml
```

[… Dockerfile](dishes/prettier_toml/Dockerfile)

</details>

### `prettier_xml`

[**Prettier XML plugin**](https://github.com/prettier/plugin-xml)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/@prettier/plugin-xml)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;XML

🚀 Quick start:

```bash
docker build \
  --build-arg prettier_xml=0.3.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
prettier --version \
  && echo '<?xml version="1.0"?><message>Hi</message>' \
    | prettier --stdin-filepath main.xml
```

[… Dockerfile](dishes/prettier_xml/Dockerfile)

</details>

### `pyflakes`

[**Pyflakes**](https://github.com/PyCQA/pyflakes)

<details>

[↻ Available versions](https://pypi.org/project/pyflakes/)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Python

🚀 Quick start:

```bash
docker build \
  --build-arg pyflakes=2.1.1 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
pyflakes --version \
  && echo 'one = 1' | pyflakes
```

[… Dockerfile](dishes/pyflakes/Dockerfile)

</details>

### `pylint`

[**Pylint**](https://www.pylint.org)

<details>

[↻ Available versions](https://pypi.org/project/pylint/)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Python

🚀 Quick start:

```bash
docker build \
  --build-arg pylint=2.4.3 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
pylint --version \
  && echo 'ONE = 1' > main.py \
  && pylint --disable missing-module-docstring main.py
```

[… Dockerfile](dishes/pylint/Dockerfile)

</details>

### `repolinter`

[**Repo Linter**](https://github.com/todogroup/repolinter)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/repolinter)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;–

🚀 Quick start:

```bash
docker build \
  --build-arg repolinter=0.7.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
echo 'No version or help.' \
  && echo \
    '{ "rules": { "all": { "license-detectable-by-licensee": ["info"] } } }' \
    > repolint.json \
  && repolinter
```

[… Dockerfile](dishes/repolinter/Dockerfile)

</details>

### `rubocop`

[**RuboCop**](https://docs.rubocop.org)

<details>

[↻ Available versions](https://rubygems.org/gems/rubocop)

[🏷 Categories:](#by-category)
&emsp;Formatter
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Ruby

🚀 Quick start:

```bash
docker build \
  --build-arg rubocop=0.76.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
rubocop --version \
  && printf "# frozen_string_literal: true\n\nputs 'Hi'\n" > main.rb \
  && rubocop
```

[… Dockerfile](dishes/rubocop/Dockerfile)

</details>

### `scalafmt`

[**Scalafmt**](http://scalameta.org/scalafmt)

<details>

[↻ Available versions](https://oss.sonatype.org/content/repositories/snapshots/org/scalameta/scalafmt-cli_2.12/)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Scala

🚀 Quick start:

```bash
docker build \
  --build-arg scalafmt=2.2.2 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
scalafmt --version \
  && echo 'object Main { println ("Hi") }' | scalafmt --stdin
```

[… Dockerfile](dishes/scalafmt/Dockerfile)

</details>

### `shellcheck`

[**ShellCheck**](https://www.shellcheck.net)

<details>

[↻ Available versions](https://hackage.haskell.org/package/ShellCheck)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Shell

🚀 Quick start:

```bash
docker build \
  --build-arg shellcheck=0.7.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
shellcheck --version \
  && printf '#!/bin/bash\necho "Hi"\n' > main.sh \
  && shellcheck main.sh
```

[… Dockerfile](dishes/shellcheck/Dockerfile)

</details>

### `spotbugs`

[**SpotBugs**](https://spotbugs.github.io)

<details>

[↻ Available versions](https://github.com/spotbugs/spotbugs/releases)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Java

🚀 Quick start:

```bash
docker build \
  --build-arg spotbugs=4.0.0-beta4 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
spotbugs -version \
  && spotbugs -textui /opt/spotbugs/lib/spotbugs.jar
```

[… Dockerfile](dishes/spotbugs/Dockerfile)

</details>

### `standard`

[**JavaScript Standard Style**](https://standardjs.com)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/standard)

[🏷 Categories:](#by-category)
&emsp;Formatter
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;JavaScript

🚀 Quick start:

```bash
docker build \
  --build-arg standard=14.3.1 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
standard --version \
  && echo 'var foo =  "bar"; console.log(foo)' | standard --fix --stdin
```

[… Dockerfile](dishes/standard/Dockerfile)

</details>

### `stylelint`

[**stylelint**](https://stylelint.io)

<details>

[↻ Available versions](https://www.npmjs.com/package/stylelint)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;CSS

🚀 Quick start:

```bash
docker build \
  --build-arg stylelint=11.1.1 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
stylelint --version \
  && echo '{ "extends": "stylelint-config-standard" }' > .stylelintrc.json \
  && echo '.a { display: none; }' | stylelint
```

[… Dockerfile](dishes/stylelint/Dockerfile)

</details>

### `tidy`

[**HTML Tidy**](http://www.html-tidy.org)

<details>

[↻ Available versions](https://pkgs.alpinelinux.org/packages?name=tidyhtml&branch=v3.10)

[🏷 Categories:](#by-category)
&emsp;Formatter
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;HTML
&emsp;XML

🚀 Quick start:

```bash
docker build \
  --build-arg tidy=5.6.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
tidy -version \
  && echo '<!DOCTYPE html><title>Hi</title>' | tidy
```

[… Dockerfile](dishes/tidy/Dockerfile)

</details>

### `tslint`

[**TSLint**](https://palantir.github.io/tslint/)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/tslint)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;TypeScript

🚀 Quick start:

```bash
docker build \
  --build-arg tslint=5.20.1 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
tslint --version \
  && tslint --init \
  && echo 'const foo = "bar";' > main.ts \
  && tslint '*.ts'
```

[… Dockerfile](dishes/tslint/Dockerfile)

</details>

### `vnu`

[**Nu Html Checker (v.Nu)**](https://validator.github.io/validator/)

<details>

[↻ Available versions](https://github.com/validator/validator/releases)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;CSS
&emsp;HTML
&emsp;SVG

🚀 Quick start:

```bash
docker build \
  --build-arg vnu=18.11.5 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
vnu --version \
  && echo '<!DOCTYPE html><title>Hi</title>' | vnu -
```

[… Dockerfile](dishes/vnu/Dockerfile)

</details>

### `wemake_python_styleguide`

[**wemake-python-styleguide**](https://wemake-python-stylegui.de)

<details>

[↻ Available versions](https://pypi.org/project/wemake-python-styleguide/)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Python

🚀 Quick start:

```bash
docker build \
  --build-arg wemake_python_styleguide=0.12.5 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
flake8 --version \
  && echo '[isort]' > setup.cfg \
  && printf '# coding=utf-8\n\n\none = 1\n' > main.py \
  && flake8 --ignore D100,D103
```

[… Dockerfile](dishes/wemake_python_styleguide/Dockerfile)

</details>

### `xmllint`

[**xmllint**](http://xmlsoft.org/xmllint.html)

<details>

[↻ Available versions](https://pkgs.alpinelinux.org/packages?name=libxml2-utils&branch=v3.10)

[🏷 Categories:](#by-category)
&emsp;Formatter
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;XML

🚀 Quick start:

```bash
docker build \
  --build-arg xmllint=2.9.9 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
xmllint --version \
  && echo '<?xml version="1.0"?><message>Hi</message>' | xmllint -
```

[… Dockerfile](dishes/xmllint/Dockerfile)

</details>

### `xo`

[**XO**](https://github.com/xojs/xo)

<details>

[↻ Available versions](https://yarnpkg.com/en/package/xo)

[🏷 Categories:](#by-category)
&emsp;Formatter
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;JavaScript
&emsp;JSX

🚀 Quick start:

```bash
docker build \
  --build-arg xo=0.24.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
xo --version \
  && echo 'const x=true' | xo --fix --stdin
```

[… Dockerfile](dishes/xo/Dockerfile)

</details>

### `yamllint`

[**yamllint**](https://yamllint.readthedocs.io)

<details>

[↻ Available versions](https://pypi.org/project/yamllint/)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;YAML

🚀 Quick start:

```bash
docker build \
  --build-arg yamllint=1.18.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
yamllint --version \
  && echo 'foo: bar' | yamllint -
```

[… Dockerfile](dishes/yamllint/Dockerfile)

</details>

### `yapf`

[**YAPF**](https://github.com/google/yapf)

<details>

[↻ Available versions](https://pypi.org/project/yapf/)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Python

🚀 Quick start:

```bash
docker build \
  --build-arg yapf=0.28.0 \
  --tag my_plate \
  https://github.com/evolutics/code-cleaner-buffet.git#0.3.0
docker run -it --rm my_plate
yapf --version \
  && echo 'y = "hello ""world"' | yapf
```

[… Dockerfile](dishes/yapf/Dockerfile)

</details>

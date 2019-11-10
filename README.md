# Code Cleaner Buffet 🍜

[![Build](https://img.shields.io/travis/evolutics/code-cleaner-buffet.svg)](https://travis-ci.org/evolutics/code-cleaner-buffet)

## Index

[`addons_linter`](#addons_linter)&emsp;
[`black`](#black)&emsp;
[`brittany`](#brittany)&emsp;
[`clang_format`](#clang_format)&emsp;
[`eslint`](#eslint)&emsp;
[`git`](#git)&emsp;
[`gitlint`](#gitlint)&emsp;
[`gofmt`](#gofmt)&emsp;
[`golangci_lint`](#golangci_lint)&emsp;
[`google_java_format`](#google_java_format)&emsp;
[`hadolint`](#hadolint)&emsp;
[`hindent`](#hindent)&emsp;
[`hlint`](#hlint)&emsp;
[`hunspell`](#hunspell)&emsp;
[`pmd`](#pmd)&emsp;
[`prettier`](#prettier)&emsp;
[`prettier_eslint`](#prettier_eslint)&emsp;
[`pyflakes`](#pyflakes)&emsp;
[`pylint`](#pylint)&emsp;
[`repolinter`](#repolinter)&emsp;
[`spotbugs`](#spotbugs)&emsp;
[`standard`](#standard)&emsp;
[`wemake_python_styleguide`](#wemake_python_styleguide)&emsp;
[`xo`](#xo)&emsp;
[`yapf`](#yapf)&emsp;

### By category

- Formatter:
  &emsp;[`black`](#black)
  &emsp;[`brittany`](#brittany)
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`gofmt`](#gofmt)
  &emsp;[`google_java_format`](#google_java_format)
  &emsp;[`hindent`](#hindent)
  &emsp;[`prettier`](#prettier)
  &emsp;[`prettier_eslint`](#prettier_eslint)
  &emsp;[`standard`](#standard)
  &emsp;[`xo`](#xo)
  &emsp;[`yapf`](#yapf)
- Linter:
  &emsp;[`addons_linter`](#addons_linter)
  &emsp;[`eslint`](#eslint)
  &emsp;[`git`](#git)
  &emsp;[`gitlint`](#gitlint)
  &emsp;[`golangci_lint`](#golangci_lint)
  &emsp;[`hadolint`](#hadolint)
  &emsp;[`hlint`](#hlint)
  &emsp;[`pmd`](#pmd)
  &emsp;[`prettier_eslint`](#prettier_eslint)
  &emsp;[`pyflakes`](#pyflakes)
  &emsp;[`pylint`](#pylint)
  &emsp;[`repolinter`](#repolinter)
  &emsp;[`spotbugs`](#spotbugs)
  &emsp;[`standard`](#standard)
  &emsp;[`wemake_python_styleguide`](#wemake_python_styleguide)
  &emsp;[`xo`](#xo)
- Spell checker:
  &emsp;[`hunspell`](#hunspell)

### By language

- Apache Velocity:
  &emsp;[`pmd`](#pmd)
- C:
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`pmd`](#pmd)
- C#:
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`pmd`](#pmd)
- C++:
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`pmd`](#pmd)
- CSS:
  &emsp;[`addons_linter`](#addons_linter)
  &emsp;[`prettier`](#prettier)
- Dockerfile:
  &emsp;[`hadolint`](#hadolint)
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
  &emsp;[`prettier`](#prettier)
- Java:
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`google_java_format`](#google_java_format)
  &emsp;[`pmd`](#pmd)
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
  &emsp;[`prettier`](#prettier)
- JSX:
  &emsp;[`eslint`](#eslint)
  &emsp;[`prettier`](#prettier)
  &emsp;[`xo`](#xo)
- Markdown:
  &emsp;[`prettier`](#prettier)
- MATLAB:
  &emsp;[`pmd`](#pmd)
- Objective-C:
  &emsp;[`clang_format`](#clang_format)
  &emsp;[`pmd`](#pmd)
- PHP:
  &emsp;[`pmd`](#pmd)
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
- Scala:
  &emsp;[`pmd`](#pmd)
- Swift:
  &emsp;[`pmd`](#pmd)
- TypeScript:
  &emsp;[`prettier`](#prettier)
- XML:
  &emsp;[`pmd`](#pmd)
- XSL:
  &emsp;[`pmd`](#pmd)
- YAML:
  &emsp;[`prettier`](#prettier)

## Dishes

### `addons_linter`

[**Add-ons Linter**](https://github.com/mozilla/addons-linter)

[↻ Available versions](https://yarnpkg.com/en/package/addons-linter)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;CSS
&emsp;HTML
&emsp;JavaScript

[… Dockerfile](dishes/addons_linter/Dockerfile)

### `black`

[**Black**](https://github.com/psf/black)

[↻ Available versions](https://pypi.org/project/black/#history)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Python

[… Dockerfile](dishes/black/Dockerfile)

### `brittany`

[**brittany**](https://github.com/lspitzner/brittany)

[↻ Available versions](https://hackage.haskell.org/package/brittany)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Haskell

[… Dockerfile](dishes/brittany/Dockerfile)

### `clang_format`

[**ClangFormat**](https://clang.llvm.org/docs/ClangFormat.html)

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

[… Dockerfile](dishes/clang_format/Dockerfile)

### `eslint`

[**ESLint**](https://eslint.org)

[↻ Available versions](https://yarnpkg.com/en/package/eslint#changelog)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;JavaScript
&emsp;JSX

[… Dockerfile](dishes/eslint/Dockerfile)

### `git`

[**Git**](https://git-scm.com)

[↻ Available versions](https://pkgs.alpinelinux.org/packages?name=git&branch=v3.10)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;–

[… Dockerfile](dishes/git/Dockerfile)

### `gitlint`

[**Gitlint**](http://jorisroovers.github.io/gitlint)

[↻ Available versions](https://pypi.org/project/gitlint/#history)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;–

[… Dockerfile](dishes/gitlint/Dockerfile)

### `gofmt`

[**gofmt**](https://golang.org/cmd/gofmt/)

[↻ Available versions](https://golang.org/dl/)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Go

[… Dockerfile](dishes/gofmt/Dockerfile)

### `golangci_lint`

[**GolangCI-Lint**](https://github.com/golangci/golangci-lint)

[↻ Available versions](https://github.com/golangci/golangci-lint/releases)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Go

[… Dockerfile](dishes/golangci_lint/Dockerfile)

### `google_java_format`

[**google-java-format**](https://github.com/google/google-java-format)

[↻ Available versions](https://github.com/google/google-java-format/releases)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Java

[… Dockerfile](dishes/google_java_format/Dockerfile)

### `hadolint`

[**Haskell Dockerfile Linter**](https://github.com/hadolint/hadolint)

[↻ Available versions](https://github.com/hadolint/hadolint/releases)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Dockerfile

[… Dockerfile](dishes/hadolint/Dockerfile)

### `hindent`

[**hindent**](https://github.com/chrisdone/hindent)

[↻ Available versions](https://hackage.haskell.org/package/hindent)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Haskell

[… Dockerfile](dishes/hindent/Dockerfile)

### `hlint`

[**HLint**](https://github.com/ndmitchell/hlint)

[↻ Available versions](https://hackage.haskell.org/package/hlint)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Haskell

[… Dockerfile](dishes/hlint/Dockerfile)

### `hunspell`

[**Hunspell**](https://hunspell.github.io)

[↻ Available versions](https://pkgs.alpinelinux.org/packages?name=hunspell&branch=v3.10)

[🏷 Categories:](#by-category)
&emsp;Spell checker

[📜 Languages:](#by-language)
&emsp;–

[… Dockerfile](dishes/hunspell/Dockerfile)

### `pmd`

[**PMD**](https://pmd.github.io)

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

[… Dockerfile](dishes/pmd/Dockerfile)

### `prettier`

[**Prettier**](https://prettier.io)

[↻ Available versions](https://yarnpkg.com/en/package/prettier#changelog)

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

[… Dockerfile](dishes/prettier/Dockerfile)

### `prettier_eslint`

[**prettier-eslint**](https://github.com/prettier/prettier-eslint-cli)

[↻ Available versions](https://yarnpkg.com/en/package/prettier-eslint-cli#changelog)

[🏷 Categories:](#by-category)
&emsp;Formatter
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;JavaScript

[… Dockerfile](dishes/prettier_eslint/Dockerfile)

### `pyflakes`

[**Pyflakes**](https://github.com/PyCQA/pyflakes)

[↻ Available versions](https://pypi.org/project/pyflakes/#history)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Python

[… Dockerfile](dishes/pyflakes/Dockerfile)

### `pylint`

[**Pylint**](https://www.pylint.org)

[↻ Available versions](https://pypi.org/project/pylint/#history)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Python

[… Dockerfile](dishes/pylint/Dockerfile)

### `repolinter`

[**Repo Linter**](https://github.com/todogroup/repolinter)

[↻ Available versions](https://yarnpkg.com/en/package/repolinter#changelog)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;–

[… Dockerfile](dishes/repolinter/Dockerfile)

### `spotbugs`

[**SpotBugs**](https://spotbugs.github.io)

[↻ Available versions](https://github.com/spotbugs/spotbugs/releases)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Java

[… Dockerfile](dishes/spotbugs/Dockerfile)

### `standard`

[**JavaScript Standard Style**](https://standardjs.com)

[↻ Available versions](https://yarnpkg.com/en/package/standard#changelog)

[🏷 Categories:](#by-category)
&emsp;Formatter
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;JavaScript

[… Dockerfile](dishes/standard/Dockerfile)

### `wemake_python_styleguide`

[**wemake-python-styleguide**](https://wemake-python-stylegui.de)

[↻ Available versions](https://pypi.org/project/wemake-python-styleguide/#history)

[🏷 Categories:](#by-category)
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;Python

[… Dockerfile](dishes/wemake_python_styleguide/Dockerfile)

### `xo`

[**XO**](https://github.com/xojs/xo)

[↻ Available versions](https://yarnpkg.com/en/package/xo)

[🏷 Categories:](#by-category)
&emsp;Formatter
&emsp;Linter

[📜 Languages:](#by-language)
&emsp;JavaScript
&emsp;JSX

[… Dockerfile](dishes/xo/Dockerfile)

### `yapf`

[**YAPF**](https://github.com/google/yapf)

[↻ Available versions](https://pypi.org/project/yapf/#history)

[🏷 Categories:](#by-category)
&emsp;Formatter

[📜 Languages:](#by-language)
&emsp;Python

[… Dockerfile](dishes/yapf/Dockerfile)

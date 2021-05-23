ARG _alpine='3.13.5'

FROM alpine:"${_alpine}"
ARG _apk_py3_pip=''
ARG wemake_python_styleguide

LABEL org.opencontainers.image.title='wemake-python-styleguide'
LABEL org.opencontainers.image.url='https://wemake-python-stylegui.de'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/wemake-python-styleguide/'
LABEL info.evolutics.buffet.version-example='0.14.1'

RUN apk add --no-cache "py3-pip${_apk_py3_pip}" \
  && pip install --no-cache-dir \
    "wemake-python-styleguide==${wemake_python_styleguide}"

WORKDIR /workdir

HEALTHCHECK CMD flake8 --version \
  && echo '[isort]' > setup.cfg \
  && printf '# coding=utf-8\n\n\none = 1\n' > main.py \
  && flake8 --ignore D100,D103

ARG _alpine='3.11.0'

FROM alpine:"${_alpine}"
ARG _apk_python3='3.8.0'
ARG wemake_python_styleguide

LABEL org.opencontainers.image.title='wemake-python-styleguide'
LABEL org.opencontainers.image.url='https://wemake-python-stylegui.de'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/wemake-python-styleguide/'
LABEL info.evolutics.buffet.version-example='0.13.3'

RUN apk add --no-cache "python3~=${_apk_python3}" \
  && pip3 install "wemake-python-styleguide==${wemake_python_styleguide}"

WORKDIR /workdir

HEALTHCHECK CMD flake8 --version \
  && echo '[isort]' > setup.cfg \
  && printf '# coding=utf-8\n\n\none = 1\n' > main.py \
  && flake8 --ignore D100,D103

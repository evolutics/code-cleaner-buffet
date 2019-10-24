ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_python3='3.7.5'
ARG wemake_python_styleguide

LABEL org.opencontainers.image.title='wemake-python-styleguide'
LABEL org.opencontainers.image.url='https://wemake-python-stylegui.de'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Python'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/wemake-python-styleguide/#history'

RUN apk add --no-cache "python3~=${_apk_python3}" \
  && pip3 install "wemake-python-styleguide==${wemake_python_styleguide}"

WORKDIR /workdir

HEALTHCHECK CMD echo '[isort]' > setup.cfg \
  && printf '# coding=utf-8\n\n\none = 1\n' > main.py \
  && flake8 --ignore D100,D103
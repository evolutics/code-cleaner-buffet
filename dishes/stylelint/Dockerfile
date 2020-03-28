ARG _alpine='3.11.3'

FROM alpine:"${_alpine}"
ARG _apk_npm=''
ARG _yarn_stylelint_config_recommended_scss='4.1.0'
ARG _yarn_stylelint_config_recommended='3.0.0'
ARG _yarn_stylelint_config_standard='19.0.0'
ARG stylelint

LABEL org.opencontainers.image.title='stylelint'
LABEL org.opencontainers.image.url='https://stylelint.io'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='CSS'
LABEL info.evolutics.buffet.versions-url='https://www.npmjs.com/package/stylelint'
LABEL info.evolutics.buffet.version-example='13.2.1'

RUN apk add --no-cache "npm${_apk_npm}" \
  && npm install --global \
    "stylelint-config-recommended-scss@${_yarn_stylelint_config_recommended_scss}" \
    "stylelint-config-recommended@${_yarn_stylelint_config_recommended}" \
    "stylelint-config-standard@${_yarn_stylelint_config_standard}" \
    "stylelint@${stylelint}"

WORKDIR /workdir

HEALTHCHECK CMD stylelint --version \
  && echo '{ "extends": "stylelint-config-standard" }' > .stylelintrc.json \
  && echo '.a { display: none; }' | stylelint

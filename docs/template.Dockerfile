# We assume a dish named as follows:
# - Title (display name): "My Boofar Tool".
# - Main command: `my-boofar`.
#
# The default order is lexicographical.

# Order these and other `ARG` instruction groups.
ARG _alpine='3.10.3'

FROM alpine:"${_alpine}"
# Option naming in general: lowercase snake case.
#
# Extra options:
# - They have defaults.
# - They are distinguished by their name pattern `_…`.
# - Their name usually indicates the used package manager.
#
# The main option (here: `my_boofar`) should be equal to the main command with
# adjusted naming style. Exceptions are possible to avoid ambiguity.
ARG _apk_foo_bar='1.2.3'
ARG my_boofar

# Order comma-separated values.
LABEL org.opencontainers.image.title='My Boofar Tool'
LABEL org.opencontainers.image.url='TODO'
LABEL info.evolutics.buffet.categories='TODO'
LABEL info.evolutics.buffet.languages='TODO'
LABEL info.evolutics.buffet.versions-url='TODO'
LABEL info.evolutics.buffet.version-example='TODO'

# Only if required.
SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# Command formatting:
# - Spread parts separated by `&&` over lines.
# - Indent by 2 spaces. Indent continuation lines once more.
# - When installing multiple packages, have each on its own line, ordered.
#
# Use `mktemp` for temporary files to not risk collisions with a fixed name.
RUN apk add --no-cache \
    "foo-bar~=${_apk_foo_bar}" \
    "my-boofar~=${my_boofar}" \
  && ls

WORKDIR /workdir

# Start the health check with one of the following, in order of preference:
# - Version information (usually `--version`).
# - General help (usually `--help`).
# - Otherwise, `echo 'No version or help.'`.
HEALTHCHECK CMD my-boofar --version \
  && echo 'Hi' | my-boofar

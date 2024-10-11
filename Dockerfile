# # create an up-to-date base image for everything
# FROM alpine:latest AS base

# RUN \
#   apk --no-cache --update-cache upgrade

# # run-time dependencies
# RUN \
#   apk --no-cache add \
#     bash \
#     curl \
#     doas \
#     python3 \
#     qt6-qtbase \
#     qt6-qtbase-sqlite \
#     tini \
#     tzdata

# syntax=docker/dockerfile:1
ARG ALPINE_VERSION=3.16.2
ARG ELIXIR_VERSION=1.14.3
ARG ERLANG_VERSION=23.3.4.18

FROM hexpm/elixir:${ELIXIR_VERSION}-erlang-${ERLANG_VERSION}-alpine-${ALPINE_VERSION} AS base
# RUN mix do local.hex --force, local.rebar --force

FROM base AS dev
RUN apk add --no-cache\
    # required by hex\
    git \
    # required by hex:phoenix_live_reload\
    inotify-tools

# RUN mix deps.get

WORKDIR /workspace
VOLUME /workspace

# Print the UID and GID
CMD echo 'Inside Container:' && \
   echo 'User: $(whoami) UID: $(id -u) GID: $(id -g)' && \
   ls -la && \
   ./build-in-docker.sh

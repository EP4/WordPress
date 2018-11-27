FROM gitpod/workspace-full:latest

# install dependencies
RUN apt-get update \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
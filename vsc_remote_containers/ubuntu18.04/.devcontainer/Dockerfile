#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

# To fully customize the contents of this image, use the following Dockerfile instead:
# https://github.com/microsoft/vscode-dev-containers/tree/v0.112.0/containers/ubuntu-18.04-git/.devcontainer/Dockerfile
FROM gnosoir/ubuntu:bionic-devel

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install gdb -y
# Clean up
#RUN apt-get autoremove -y \
#   && apt-get clean -y \
#   && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=dialog

#ENV PATH $PATH:/usr/local/anaconda3/bin

#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

# To fully customize the contents of this image, use the following Dockerfile instead:
# https://github.com/microsoft/vscode-dev-containers/tree/v0.112.0/containers/ubuntu-18.04-git/.devcontainer/Dockerfile
#FROM mcr.microsoft.com/vscode/devcontainers/base:0-ubuntu-18.04
FROM gnosoir/nvidia-cuda:10.0-devel

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install gdb
#RUN apt-get update \
#    && apt-get -y install --no-install-recommends \
#        apt-utils build-essential software-properties-common \
#        openssl libssl-dev sudo curl wget \
#        mlocate tree vim zsh git-core gdb \
#    # Clean up
#    && apt-get autoremove -y \
#    && apt-get clean -y \
#    && rm -rf /var/lib/apt/lists/*

#ARG USERNAME=songming
#ARG USER_UID=1001
#ARG USER_GID=$USER_UID

## [Optional] Create the user
#&& groupadd --gid $USER_GID $USERNAME \
#&& useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
#&& mkdir -p /home/$USERNAME/.vscode-server/extensions \
#    /home/$USERNAME/.vscode-server-insiders/extensions \
#&& chown -R $USERNAME \
#    /home/$USERNAME/.vscode-server \
#    /home/$USERNAME/.vscode-server-insiders \
## Add sudo support. Omit if you don't need to install software after connecting.
#&& echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
#&& chmod 0440 /etc/sudoers.d/$USERNAME \

# [Optional] Set the default user. Omit if you want to keep the default as root.
# USER $USERNAME

ENV DEBIAN_FRONTEND=dialog

#ENV PATH /usr/local/anaconda3/bin:$PATH

#CMD ["/usr/bin/zsh"]

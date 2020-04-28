#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

# To fully customize the contents of this image, use the following Dockerfile instead:
# https://github.com/microsoft/vscode-dev-containers/tree/v0.112.0/containers/ubuntu-18.04-git/.devcontainer/Dockerfile
#FROM mcr.microsoft.com/vscode/devcontainers/base:0-ubuntu-18.04
FROM nvidia/cuda:10.0-devel

RUN chmod 777 /tmp
ADD dotphiles /opt/dotphiles

ARG USERNAME=songming
ARG USER_UID=1001
ARG USER_GID=$USER_UID

ENV DEBIAN_FRONTEND=noninteractive

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && cp /opt/dotphiles/ali.list /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends \
        apt-utils build-essential software-properties-common \
        openssl libssl-dev sudo curl wget \
        mlocate tree vim zsh git-core \
    # Install cmake3
    && tar -zxvf /opt/dotphiles/cmake-3.16.5.tar.gz -C /opt \
    && cd /opt/cmake-3.16.5 && ./bootstrap && make && make install \
    && cd /root && rm -rf /opt/cmake-3.16.5 \
    # Install Anaconda3
    && cp /opt/dotphiles/dot_condarc /root/.condarc \
    && wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2020.02-Linux-x86_64.sh \
        -O /tmp/anaconda3.sh \
    && bash /tmp/anaconda3.sh -b -p /usr/local/anaconda3 \
    # Configure GIT
    && git config --global user.name ${USERNAME} \
    && git config --global user.email "${USERNAME}@dev.org" \
    # Create the user
    && groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && mkdir -p /home/$USERNAME/.vscode-server/extensions \
        /home/$USERNAME/.vscode-server-insiders/extensions \
    && chown -R $USERNAME \
        /home/$USERNAME/.vscode-server \
        /home/$USERNAME/.vscode-server-insiders \
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    # Clean up
    && updatedb && rm -rf /tmp/*

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

RUN git config --global user.name ${USERNAME} \
    && git config --global user.email "${USERNAME}@dev.org" \
    # Configure VIM
    && mkdir -p /home/${USERNAME}/.vim/bundle \
    && git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git \
        /home/${USERNAME}/.vim/bundle/Vundle.vim \
    && cp /opt/dotphiles/dot_vimrc /home/${USERNAME}/.vimrc \
    && vim -c PluginInstall -c q -c q \
    # Configure Python
    && mkdir /home/${USERNAME}/.pip && cp /opt/dotphiles/pip.conf /home/${USERNAME}/.pip/pip.conf \
    && cp /opt/dotphiles/pythonstartup.py /home/${USERNAME}/.pythonstartup \
    # Configure Zsh by Oh-My-ZSH
    && git clone --depth 1 https://github.com/robbyrussell/oh-my-zsh.git /home/${USERNAME}/.oh-my-zsh \
    && git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
        /home/${USERNAME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
    && cp /opt/dotphiles/dot_zshrc /home/${USERNAME}/.zshrc \
    && /usr/local/anaconda3/bin/conda init zsh bash

ENV DEBIAN_FRONTEND=dialog

#ENV PATH /usr/local/anaconda3/bin:$PATH

CMD /usr/bin/zsh
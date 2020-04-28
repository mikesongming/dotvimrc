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

ENV DEBIAN_FRONTEND=noninteractive

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    ln -s /opt/dotphiles/ali.list /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y install --no-install-recommends \
        apt-utils build-essential software-properties-common \
        openssl libssl-dev curl wget \
        mlocate tree vim zsh git-core && \
    git config --global user.name "songming" && \
    git config --global user.email "gnosoir@hotmail.com" && \
    tar -zxvf /opt/dotphiles/cmake-3.16.5.tar.gz -C /opt && \
    cd /opt/cmake-3.16.5 && ./bootstrap && make && make install && \
    cd /root && rm -rf /opt/cmake-3.16.5 && \
    mkdir -p /root/.vim/bundle && \
    git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim && \
    ln -s /opt/dotphiles/dot_vimrc /root/.vimrc && \
    vim -c PluginInstall -c q -c q && \
    ln -s /opt/dotphiles/dot_condarc /root/.condarc && \
    wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2020.02-Linux-x86_64.sh -O /tmp/anaconda3.sh && \
    bash /tmp/anaconda3.sh -b -p /usr/local/anaconda3 && \
    /usr/local/anaconda3/bin/conda init zsh bash && \
    mkdir /root/.pip && ln -s /opt/dotphiles/pip.conf /root/.pip/pip.conf && \
    ln -s /opt/dotphiles/pythonstartup.py /root/.pythonstartup && \
    git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    ln -s /opt/dotphiles/dot_zshrc /root/.zshrc && \
    updatedb && rm -rf /tmp/* && \
    chsh -s /bin/zsh

ENV DEBIAN_FRONTEND=dialog

#ENV PATH $PATH:/usr/local/anaconda3/bin
CMD /usr/bin/zsh
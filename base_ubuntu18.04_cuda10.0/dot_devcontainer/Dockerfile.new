#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

# To fully customize the contents of this image, use the following Dockerfile instead:
# https://github.com/microsoft/vscode-dev-containers/tree/v0.112.0/containers/ubuntu-18.04-git/.devcontainer/Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/base:0-ubuntu-18.04

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
COPY ali.list /etc/apt/sources.list

RUN apt-get update

# ** [Optional] Uncomment this section to install additional packages. **

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
   && apt-get -y install --no-install-recommends apt-utils build-essential software-properties-common \
        openssl libssl-dev curl wget mlocate tree vim zsh git-core

# Install VIM plugins
RUN mkdir -p /root/.vim/bundle
RUN git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
#RUN git clone --depth 1 https://github.com/scrooloose/nerdtree.git /root/.vim/bundle/nerdtree
#RUN git clone --depth 1 https://github.com/Yggdroot/indentLine.git /root/.vim/bundle/indentLine
#RUN git clone --depth 1 https://github.com/SirVer/ultisnips.git /root/.vim/bundle/ultisnips
#RUN git clone --depth 1 https://github.com/honza/vim-snippets.git /root/.vim/bundle/vim-snippets
COPY dot_vimrc /root/.vimrc
RUN vim -c PluginInstall -c q -c q

# Install Anaconda3
COPY dot_condarc /root/.condarc
RUN wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2020.02-Linux-x86_64.sh \
            -O /tmp/anaconda3.sh
RUN bash /tmp/anaconda3.sh -b -p /usr/local/anaconda3 \
   && rm -f /tmp/anaconda3.sh

# Install Cmake3.16
COPY cmake-3.16.5.tar.gz /tmp/
RUN cd /tmp && tar -zxvf /tmp/cmake-3.16.5.tar.gz \
   && cd cmake-3.16.5 && ./bootstrap \
   && make && make install

# Clean up
RUN apt-get autoremove -y \
   && apt-get clean -y \
   && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

# config GIT
RUN git config --global user.name "songming"
RUN git config --global user.email "gnosoir@hotmail.com"

# config ANACONDA
RUN /usr/local/anaconda3/bin/conda init zsh bash
RUN mkdir /root/.pip
COPY pip.conf /root/.pip/
COPY pythonstartup.py /root/.pythonstartup

# config zsh & oh-my-zsh
#RUN git clone --depth 1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
#    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc 
RUN git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
   ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
COPY dot_zshrc /root/.zshrc

RUN updatedb
RUN rm -rf /tmp/*

#ENV PATH $PATH:/usr/local/anaconda3/bin

RUN chsh -s /bin/zsh
CMD /usr/bin/zsh
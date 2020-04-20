#FROM nvidia/cuda:10.00-devel
FROM 7d4f573dfb91
RUN chmod 777 /tmp

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
COPY ali.list /etc/apt/sources.list

RUN apt-get update
RUN sleep 3

RUN apt-get install curl wget -y
RUN apt-get install vim -y

RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:git-core/ppa -y
RUN apt-get update
RUN apt-get install git -y
RUN git config --global user.name "songming"
RUN git config --global user.email "gnosoir@hotmail.com"

COPY dot_vimrc ~/.vimrc
RUN mkdir -p ~/.vim/bundle
RUN git clone --depth 0 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim -c PluginInstall

RUN curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh 
COPY dot_zshrc ~/.zshrc
#COPY pythonstartup.py ~/.pythonstartup

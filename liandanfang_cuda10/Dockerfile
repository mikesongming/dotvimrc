#FROM nvidia/cuda:10.00-devel
FROM 7d4f573dfb91
RUN chmod 777 /tmp

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
COPY ali.list /etc/apt/sources.list

RUN apt-get update
RUN sleep 3

RUN apt-get install curl wget mlocate tree -y
RUN apt-get install apt-utils -y
RUN apt-get install build-essential libssl-dev -y
RUN apt-get install vim -y

RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:git-core/ppa -y
RUN apt-get update
RUN apt-get install git -y
RUN git config --global user.name "songming"
RUN git config --global user.email "gnosoir@hotmail.com"

COPY dot_vimrc /root/.vimrc
RUN mkdir -p /root/.vim/bundle
RUN git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
#RUN vim -c PluginInstall

RUN apt-get install zsh -y
RUN chsh -s /usr/bin/zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
COPY dot_zshrc /root/.zshrc

RUN wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2020.02-Linux-x86_64.sh  -O /root/anaconda3.sh
RUN bash /root/anaconda3.sh -b -p /usr/local/anaconda3 \
    && rm /root/anaconda3.sh 
ENV PATH /usr/local/anaconda3/bin:$PATH

RUN mkdir /root/.pip
COPY pip.conf /root/.pip/
COPY dot_condarc /root/.condarc
COPY pythonstartup.py /root/.pythonstartup

RUN apt-get install openssl libssl-dev -y
COPY cmake-3.16.5.tar.gz /data/
RUN tar -zxvf /data/cmake-3.16.5.tar.gz
RUN cd cmake-3.16.5 && ./bootstrap && make && make install

RUN updatedb
RUN rm -rf data

CMD /usr/bin/zsh

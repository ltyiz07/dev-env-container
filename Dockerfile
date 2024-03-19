FROM ubuntu:22.04

RUN sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install software-properties-common
RUN apt-get -y update
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get -y install\
	netcat \
	python3 \
	git \
	neovim \
	net-tools\
	build-essential \
	curl \
	sudo \
	tmux \
	netcat \
	locales \
	zsh 
RUN apt-get -y clean \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*

# Set locale as Korea
RUN locale-gen ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

WORKDIR /root

# Install node with nvm and sourcing
RUN mkdir /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 21
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash \
	&& . $NVM_DIR/nvm.sh \
	&& nvm install $NODE_VERSION \
	&& nvm alias default $NODE_VERSION \
	&& nvm use default
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
RUN . $NVM_DIR/nvm.sh

# Install rust and sourcing
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN . $HOME/.cargo/env
RUN . $HOME/.cargo/env
## Dev tools installed #####

RUN echo 'root:Docker!' | chpasswd

# Make dockerfile waiting
CMD ["tail", "-f", "/dev/null"]

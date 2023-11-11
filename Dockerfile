FROM ubuntu:22.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y \
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
	zsh \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /root

# Set local locale
RUN locale-gen ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

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

# Install rust and sourcing
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN . $HOME/.cargo/env

# Setting utiltities
COPY ./.tmux.conf /root/.tmux.conf
COPY ./.gitconfig /root/.gitconfig
COPY ./.git-credentials /root/.git-credentials
COPY ./.zshenv /root/.zshenv
COPY ./.config/zsh/.zshrc /root/.config/zsh/.zshrc

# Make dockerfile wwaiting
RUN . $HOME/.zshenv
CMD ["tail", "-f", "/dev/null"]

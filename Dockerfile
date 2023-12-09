ARG USER_ID
ARG GROUP_ID
ARG USER_NAME

FROM ubuntu:22.04

RUN sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install software-properties-common
RUN apt-get -y update
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get -y update
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
	zsh \
	openjdk-19-jdk
RUN apt-get -y clean \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*

# Set locale as Korea
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
RUN mkdir /usr/local/rust
ENV RUSTUP_HOME /usr/local/rust
ENV CARGO_HOME /usr/local/rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH $RUSTUP_HOME/bin:$PATH

# Set user
RUN echo 'root:root' | chpasswd
ARG USER_ID
ARG GROUP_ID
ARG USER_NAME
RUN groupadd -g ${GROUP_ID} ${USER_NAME} &&\
    useradd -l -u ${USER_ID} -g ${USER_NAME} ${USER_NAME} &&\
    usermod -aG sudo ${USER_NAME} &&\
    install -d -m 0755 -o ${USER_NAME} -g ${USER_NAME} /home/${USER_NAME}
RUN echo "${USER_NAME}:${USER_NAME}" | chpasswd
USER ${USER_NAME}
WORKDIR /home/${USER_NAME}

# Set envs
RUN . $NVM_DIR/nvm.sh
RUN . $RUSTUP_HOME/env

# Make dockerfile waiting
CMD ["tail", "-f", "/dev/null"]

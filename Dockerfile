FROM ubuntu:16.04
MAINTAINER Fan Jiang <fan.torchz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Add custom china source
ADD sources.list /etc/apt/
# build essentials
RUN apt-get update && apt-get -y upgrade && apt-get -y install wget
RUN apt-get -y --no-install-recommends install \
  aptitude \
  bash-completion \
  build-essential \
  cmake \
  cmake-curses-gui \
  coreutils \
  gcc \
  g++ \
  gdb \
  git-core \
  htop \
  mercurial \
  ncdu \
  ninja-build \
  python \
  python-dev \
  python-pip \
  python-software-properties \
  software-properties-common \
  subversion \
  tmux \
  tree \
  unzip \
  vim

WORKDIR /tmp/workspace/
RUN wget http://man7.org/tlpi/code/download/tlpi-171205-dist.tar.gz && \
    tar -xf tlpi-171205-dist.tar.gz && \
    mv tlpi-dist tlpi && \
    rm tlpi-171205-dist.tar.gz

WORKDIR /tmp/workspace/tlpi
RUN make
WORKDIR /tmp/workspace/demo
ENTRYPOINT touch pandora && /tmp/workspace/tlpi/inotify/demo_inotify /tmp/workspace/demo/pandora

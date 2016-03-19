FROM ubuntu:14.04
MAINTAINER Brandon Amos <brandon.amos.cs@gmail.com>
RUN apt-get update
RUN apt-get install curl git -y
RUN apt-get install -y software-properties-common

RUN curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash -e
RUN git clone https://github.com/torch/distro.git ~/torch --recursive
RUN cd ~/torch && ./install.sh

RUN ~/torch/install/bin/luarocks install nn
RUN ~/torch/install/bin/luarocks install image
RUN ~/torch/install/bin/luarocks install optim

RUN apt-get install -y libprotobuf-dev protobuf-compiler
RUN ~/torch/install/bin/luarocks install loadcaffe

FROM ubuntu:14.04
MAINTAINER Brandon Amos <brandon.amos.cs@gmail.com>
RUN apt-get update
RUN apt-get install curl git -y

RUN curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash -e
RUN git clone https://github.com/torch/distro.git ~/torch --recursive
RUN cd ~/torch && ./install.sh

RUN luarocks install nn
RUN luarocks install image
RUN luarocks install optim

# Build without GPU libraries.
#RUN git clone git clone https://github.com/szagoruyko/loadcaffe.git

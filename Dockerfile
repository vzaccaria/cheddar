FROM ubuntu:14.04

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y \
    libc6-i386 \
    libsm6:i386 \
    libxrender1:i386 \
    libcanberra-gtk-module:i386

RUN apt-get install -y wget

WORKDIR /root

RUN wget http://beru.univ-brest.fr/svn/CHEDDAR/releases/Cheddar-3.2-Linux32-bin.tar.gz

RUN tar -xvzf Cheddar-3.2-Linux32-bin.tar.gz -C /usr/local


RUN apt-get install -y vim
RUN apt-get install -y strace

ENV CHEDDAR_INSTALL_PATH=/usr/local/Cheddar-3.2-Linux32-bin/
ENV PATH=$CHEDDAR_INSTALL_PATH:$PATH
ENV LIBRARY_PATH=$CHEDDAR_INSTALL_PATH/lib/linux32:$CHEDDAR_INSTALL_PATH/lib/linux32/gtk-2.0/modules:$LIBRARY_PATH
ENV LD_LIBRARY_PATH=$LIBRARY_PATH:$LD_LIBRARY_PATH


FROM ubuntu:20.04

RUN apt-get update -qq && apt-get install --no-install-recommends --yes sudo

ENV USER docker
RUN useradd --create-home $USER && \
        gpasswd --add $USER sudo && \
        echo "$USER:password" | chpasswd
USER $USER
WORKDIR /home/$USER

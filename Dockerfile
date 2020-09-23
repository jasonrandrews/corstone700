FROM ubuntu:18.04

RUN echo "root:corstone700" | chpasswd

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update  
RUN apt-get upgrade -y

RUN apt-get install -y sudo vim iputils-ping net-tools dialog software-properties-common apt-utils make libc6-i386 lib32z1 lib32stdc++6 git 

RUN apt-get install -y chrpath gawk texinfo libssl-dev diffstat wget git-core unzip gcc-multilib  build-essential socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils  iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 xterm git-lfs openssl  curl libncurses-dev libz-dev python-pip 

RUN apt-get install -y device-tree-compiler uuid-dev g++-multilib genext2fs bridge-utils libxml2-dev bison expect libxml2-utils gperf acpica-tools flex locales

RUN locale-gen en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN useradd --create-home -s /bin/bash -m ubuntu && echo "ubuntu:corstone700" | chpasswd && adduser ubuntu sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/ubuntu
USER ubuntu

ADD --chown=ubuntu:ubuntu FVP_Corstone_700_11.10_47.tgz /home/ubuntu

RUN /home/ubuntu/FVP_Corstone_700.sh --i-agree-to-the-contained-eula 

RUN git clone https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git

RUN git config --global user.name "Ubuntu"
RUN git config --global user.email "none@empty.com"
RUN git config --global color.diff "auto"

COPY --chown=ubuntu:ubuntu bake.sh /home/ubuntu/
RUN /home/ubuntu/bake.sh



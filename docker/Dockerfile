FROM ubuntu:20.04
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends apt-utils nano net-tools dnsutils ca-certificates openssh-server
RUN apt-get install -y --no-install-recommends build-essential git cmake ruby nasm
RUN apt-get install -y --no-install-recommends automake autoconf shtool libtool

COPY files/sshd_config /etc/ssh/
RUN mkdir -p /run/sshd
CMD ["/usr/sbin/sshd", "-D"]

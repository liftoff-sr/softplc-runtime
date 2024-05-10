#FROM debian:bullseye-slim
FROM softplc/gatecraft

MAINTAINER Dick Hollenbeck "dick@softplc.com"

ADD start.sh install-amd64-tlms.sh /

# These commands are used with FROM bullseye-slim, not FROM softplc/gatecraft
#RUN apt-get update && apt-get install -y gnupg \
#    && mkdir /root/.gnupg && chmod 700 /root/.gnupg \
#    && echo "deb  https://dl.softplc.com/gatecraft-repos buster embedded" > /etc/apt/sources.list.d/gatecraft.list \
#    && gpg --no-default-keyring \
#        --keyring gnupg-ring:/etc/apt/trusted.gpg.d/gatecraft.gpg \
#        --keyserver keyserver.ubuntu.com --recv 610E49CA \
#    && chmod 644 /etc/apt/trusted.gpg.d/gatecraft.gpg

RUN apt-get update \
    && apt-get install --no-install-recommends -y openssh-server softplc-runtime \
    && mkdir /run/sshd && chmod 644 /run/sshd && chown root:root /run/sshd \
    && echo 'root:softplc' | chpasswd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
    && echo "The IP Address of a docker container is not changeable here." > /etc/NETWORKS.LST \
    && ./install-amd64-tlms.sh \
    && rm ./install-amd64-tlms.sh

ENV LD_LIBRARY_PATH "/SoftPLC/run"

EXPOSE 22 2222 2223  2223/udp

WORKDIR /SoftPLC/run

CMD [ "/start.sh" ]

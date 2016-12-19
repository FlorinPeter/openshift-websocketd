FROM registry.access.redhat.com/rhel7.3:latest

MAINTAINER Florin Peter 

RUN yum -y install wget unzip && yum clean all -y
RUN wget https://github.com/joewalnes/websocketd/releases/download/v0.2.11/websocketd-0.2.11-linux_amd64.zip
RUN unzip websocketd-0.2.11-linux_amd64.zip

ADD my-program /bin/my-program.sh
ADD websocketd /bin/websocketd
RUN chmod +x /bin/my-program.sh
RUN chmod +x /bin/websocketd

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8080
CMD ["websocketd",  "--port=8080", "my-program.sh"]


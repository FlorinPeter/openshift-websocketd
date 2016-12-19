FROM registry.access.redhat.com/rhel7.3:latest

MAINTAINER Florin Peter 

RUN yum -y install wget unzip && yum clean all -y

ADD my-program /bin/my-program.sh
RUN wget https://github.com/joewalnes/websocketd/releases/download/v0.2.11/websocketd-0.2.11-linux_amd64.zip
RUN unzip websocketd-0.2.11-linux_amd64.zip -d /bin/
RUN chmod +x /bin/my-program.sh
RUN chmod +x /bin/websocketd

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8080
CMD ["websocketd",  "--port=8080", "my-program.sh"]


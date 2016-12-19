FROM registry.access.redhat.com/rhel7.3:latest

MAINTAINER Florin Peter 

EXPOSE 8080

RUN yum -y install wget unzip && yum clean all -y
RUN wget https://github.com/joewalnes/websocketd/releases/download/v0.2.11/websocketd-0.2.11-linux_amd64.zip
RUN unzip websocketd-0.2.11-linux_amd64.zip

ADD my-program /bin/my-program.sh
RUN chmod +x /bin/my-program.sh

CMD ["./websocketd",  "--port=8080", "my-program.sh"]


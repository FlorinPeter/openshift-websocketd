FROM registry.access.redhat.com/rhel7:latest

MAINTAINER Florin Peter 

RUN wget https://github.com/joewalnes/websocketd/releases/download/v0.2.11/websocketd-0.2.11-linux_amd64.zip
RUN unzip websocketd-0.2.11-linux_amd64.zip

CMD ["websocketd --port=8080 my-program"]


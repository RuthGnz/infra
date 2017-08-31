FROM jenkins
USER root
RUN apt-get update
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN apt-get install -y software-properties-common
RUN apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
RUN apt-get install apt-transport-https
RUN apt-get update
RUN apt-get install -y docker-engine
RUN usermod -aG docker $(whoami)
RUN usermod -aG docker jenkins
RUN apt-get -y install python-pip
RUN pip install docker-compose
RUN wget https://releases.hashicorp.com/terraform/0.10.2/terraform_0.10.2_linux_386.zip
RUN unzip terraform_0.10.2_linux_386.zip
ENV PATH=$PATH:.
RUN apt-get install software-properties-common
RUN apt-get install ansible -y
RUN apt-get install build-essential libssl-dev libffi-dev python-dev -y
RUN pip install pynacl
RUN pip install bcrypt

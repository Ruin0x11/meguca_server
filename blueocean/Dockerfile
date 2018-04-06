FROM jenkins/jenkins:lts

ADD jenkins-id_rsa /home/jenkins/.ssh/id_rsa
ADD jenkins-id_rsa.pub /home/jenkins/.ssh/id_rsa.pub

ENV COMPOSE_VERSION 1.12.0

# Add repository for docker-ce
USER root
RUN apt-get update \
      && apt-get -y install --no-install-recommends apt-transport-https ca-certificates curl software-properties-common \
      && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
      && apt-key fingerprint 0EBFCD88 | grep docker@docker.com || exit 1 \
      && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
      && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
      && apt-get -y install --no-install-recommends docker-ce \
      && rm -rf /var/lib/apt/lists/*

RUN apt-get update -q \
      && curl -o /usr/local/bin/docker-compose -L \
      "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-Linux-x86_64" \
      && chmod +x /usr/local/bin/docker-compose \
      && rm -rf /var/lib/apt/lists/*

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

USER root
RUN groupmod -g 975 docker \
      && usermod -a -G docker jenkins \
      && chown -R 1000:1000 /home/jenkins

USER jenkins

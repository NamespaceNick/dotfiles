#!/usr/bin/bash

# update repositories
# TODO: Add that

# install docker repository
sudo apt-get install \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	software-properties-common

# add docker's official key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add the stable repository
sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"

# actually install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io

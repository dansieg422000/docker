msg "Installing Docker ... " heading2

##0# TMS Configuration ###

# Install Docker
sudo apt-get install -yqq \
    linux-headers-$(uname -r) \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

# Docker GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Docker stable repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Docker CE
sudo apt-get update -q
sudo apt-get install -yqq docker-ce

## Docker Compose

sudo curl -sL "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

msg "Docker install completed." heading2

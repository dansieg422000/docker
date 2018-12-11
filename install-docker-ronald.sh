#msg "Installing Docker ... " heading2

echo "Installing Docker..."

sudo su root

# Update existing package
sudo apt-get update

# Install a few prerequisite packages which let apt use packages over HTTPS
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add the GPG key for the official Docker repository to the system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify that key with fingerprint
sudo apt-key fingerprint 0EBFCD88


# Add the Docker repository to APT sources
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

# Update the package database
sudo apt-get update

# Install the Docker
sudo apt-get -y install docker-ce

# check if /usr/bin/docker-compose directory exist
if [ ! -d "/usr/bin/docker-compose"]; then
   sudo mkdir /usr/bin/docker-compose	
fi	

if [ ! -d "/usr/local/bin/docker-compose"]; then
   sudo mkdir /usr/local/bin/docker-compose
fi

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
#sudo mkdir /usr/bin/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose


# -- Download Docker image --
#echo "Start the Docker image download"
#echo "Downloading Apache webserver from dansieg/apache:v1"
#docker run -d dansieg/apache:v1
#echo "Download completed for Apache webserver"
#echo "Docker image download completed"


# Run docker-compose
echo "Run the docker-compose"
cd /vagrant/Docker
sudo docker-compose up -d



#msg "Docker install completed." heading2
echo "Docker install completed..."

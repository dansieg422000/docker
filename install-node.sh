echo "Starting to install Nodejs...:wq"

sudo apt install curl

curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -

sudo apt install -y nodejs

echo "$(----- Node version is)  $(node -v)"

echo "$(----- NPM version is)  $(npm -v)"

echo "Nodejs was successfully installed..."







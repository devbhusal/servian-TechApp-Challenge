#!/bin/bash
# variable will be populated by terraform template
db_username=${db_username}
db_user_password=${db_user_password}
db_name=${db_name}
db_RDS_pre=${db_RDS}
# removing port number from endpoint
db_RDS=$(echo $db_RDS_pre|cut -f1 -d":") 


apt update -y
apt install git

# Installing GoLang and configuring env
wget https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz
tar -xvf go1.16.4.linux-amd64.tar.gz
mv go /usr/local
apt install golang-rice -y
mkdir -p /home/ubuntu/go/{bin,pkg,src,cache}
export GOROOT=/usr/local/go
export GOPATH=/home/ubuntu/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH 
export GOCACHE=/home/ubuntu/go/cache
export GOBIN=/home/ubuntu/go/bin


# Downloading TechChallengeApp from github
cd /home/ubuntu
git clone https://github.com/servian/TechChallengeApp.git
cd TechChallengeApp
# Configuring conf.toml to include database details
rm conf.toml
cat <<EOF >>conf.toml
"DbUser" = "$db_username"
"DbPassword" = "$db_user_password"
"DbName" = "$db_name"
"DbPort" = "5432"
"DbHost" = "$db_RDS"
"ListenHost" = "0.0.0.0"
"ListenPort" = "80"

EOF

# Building The Package and starting webserver
bash build.sh
cd ./dist
./TechChallengeApp updatedb -s
./TechChallengeApp serve





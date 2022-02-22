- create ec2 machine
- login by putty
- install docker and docker-componse
    apt update -y
    apt install -y docker.io
    apt install -y docker-compose
    systemctl start docker
    apt install git
    git clone https://github.com/docker/awesome-compose.git

cd to awesome-componse/angular

vi docker-componse,yaml 
added 
version: '3'
on keyboard escape key add :wq
save and quite file by vi editor 
-----------------------------------
docker-componse up -d 
docker images 
docker ps
----------------------------------
in SG you have to allow tracffi on 4200 port from inbout rule
take pulic ip:4200, you be able to see app is running
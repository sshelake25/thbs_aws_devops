How to build image from docker file

docker build -t mynode-app -f "Dockerfile-node" .
------------------------------------------------
generate image from custome docker file


push custome image docker registory 
------------------------------------------------

cd /docker/

git clone https://github.com/sshelake25/thbs_aws_devops.git  
cd thbs_aws_debops

-----------------------------------------------

- create repo inside hub
- on machine 
- login to hub from your in order to push
 $ docker login

- docker push sshelake25/thbs_aws_dev:tagname

- docker build -t sshelake25/thbs_aws_dev:s-nodeapp -f "Dockerfile-node" .
- docker push sshelake25/thbs_aws_dev:s-nodeapp

-----------------------------------
If someone want to user my image to run container 
docker pull sshelake25/thbs_aws_dev:s-nodeapp

docker run -d -p 8090:3000 sshelake25/thbs_aws_dev:s-nodeapp

http://ipaddress:8090/list_movies
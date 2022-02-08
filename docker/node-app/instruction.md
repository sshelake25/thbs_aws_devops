How to build image from docker file

docker build -t mynode-app -f "Dockerfile-node" .
------------------------------------------------
generate image from custome docker file


push custome image docker registory 
------------------------------------------------
- create repo inside hub
- on machine 
- login to hub from your in order to push
 $ docker login

- docker push sshelake25/thbs_aws_dev:tagname

docker build -t sshelake25/thbs_aws_dev:s-nodeapp
docker push sshelake25/thbs_aws_dev:s-nodeapp
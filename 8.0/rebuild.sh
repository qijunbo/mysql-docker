docker container prune -f 
docker image rm  qijunbo/mysql
docker image build -t qijunbo/mysql  .
docker images

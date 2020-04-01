# docker-demo
## Install Docker
```
sudo yum install docker -y
sudo /etc/init.d/docker start
sudo usermod -aG docker $USER

docker ps (should return the below)
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

## Clone the docker-demo repo
```
git clone https://github.com/dewjam/docker-demo.git
cd docker-demo
```
## Build an image
Review the Dockerfile first to understand what it's actually doing:
`cat Dockerfile`

Then, let's build the image:
```
docker build -t docker-demo .
```

Let's look at what we built:
`docker images`

## Create a container based on the image we just created
Run the container via docker:
```
docker run -itd --name docker-demo -p 80:80 docker-demo .
```

Check to see if the container is running:
```
docker ps


```

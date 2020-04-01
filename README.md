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
```
cat Dockerfile
```

```
FROM centos:7

RUN yum install epel-release -y && \
    yum install nginx -y

CMD ["nginx", "-g", "daemon off;"]
```

Now, let's build the image:
```
docker build -t docker-demo .

Sending build context to Docker daemon    64 kB
Step 1 : FROM centos:7
 ---> 5e35e350aded
Step 2 : RUN yum install epel-release -y &&     yum install nginx -y
 ---> Using cache
 ---> 0d6ba8e7be91
Step 3 : CMD nginx -g daemon off;
 ---> Using cache
 ---> c3a996e3ac88
Successfully built c3a996e3ac88
```

Let's look at what we built:
```
docker images

REPOSITORY                                 TAG                 IMAGE ID            CREATED             SIZE
docker-demo                                latest              c3a996e3ac88        30 minutes ago      428.5 MB
```

## Run a container based on the image we just created
Run the container image:
```
docker run -itd --name docker-demo -p 80:80 docker-demo
```

Check to see if the container is running:
```
docker ps

CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
df99344c4a56        docker-demo         "nginx -g 'daemon off"   2 seconds ago       Up 1 seconds        0.0.0.0:80->80/tcp   docker-demo
```

## Test
Just do a basic curl to localhost:
```
curl http://localhost
```

Or just connect to your dev-dsk via a web browser:

## Cleanup
Remove the container
```
docker rm -f docker-demo
```

Remove the image
```
docker rmi docker-demo
```

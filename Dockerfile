FROM centos:7

RUN yum install epel-release -y && \
    yum install nginx -y

COPY index.html /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]


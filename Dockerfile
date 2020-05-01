FROM centos:latest
RUN yum -y install httpd
RUN mkdir /s2iscripts
COPY assemble /s2iscripts/
COPY run /s2iscripts/ 
RUN chmod +x /s2iscripts/*
RUN chown -R 1001:0 /s2iscripts/
RUN chown -R 1001:0 /var/www/html/
RUN sed -i 's/#ServerName www.example.com:80/ServerName localhost:80/g' /etc/httpd/conf/httpd.conf
LABEL io.openshift.s2i.scripts-url="image:///s2iscripts"
EXPOSE 80
USER 1001

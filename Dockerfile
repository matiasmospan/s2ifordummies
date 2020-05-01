FROM centos:latest
RUN yum -y install httpd
RUN mkdir /s2iscripts
COPY assemble /s2iscripts/
COPY run /s2iscripts/ 
RUN chmod +x /s2iscripts/*
LABEL io.openshift.s2i.scripts-url="image:///s2iscripts"
EXPOSE 80

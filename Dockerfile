
FROM centos:7

LABEL \
        author="William Viktorsson" \
        version="1.0.0" \
        description="This is a minimal image containing stress-ng and the stream benchmark."

ENV SHELL=/bin/bash

RUN \
  yum install -y wget && \
  wget http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/ && \
  rpm -Uvh epel-release*rpm && \
  yum install -y stress-ng && \
  yum install -y gcc && \
  wget http://www.cs.virginia.edu/stream/FTP/Code/stream.c && \
  gcc -O stream.c -o stream && mv stream /usr/bin/ && \
  yum clean all

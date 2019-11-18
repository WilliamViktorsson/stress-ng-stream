
FROM centos:7

LABEL \
        author="William Viktorsson" \
        version="1.0.0" \
        description="This is a minimal image containing stress-ng and the stream benchmark."

ENV SHELL=/bin/bash

RUN \
  rpm --rebuilddb && yum clean all && \
  yum install -y epel-release && \
  yum install -y libaio libbsd wget && \
  yum install -y wget && \
  yum install -y stress-ng && \
  yum install -y gcc && \
  wget http://www.cs.virginia.edu/stream/FTP/Code/stream.c && \
  gcc -O stream.c -o stream && mv stream /usr/bin/ && \
  yum clean all

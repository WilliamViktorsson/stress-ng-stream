
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
  cd /tmp/ && wget http://dl.fedoraproject.org/pub/fedora/linux/updates/testing/25/x86_64/s/stress-ng-0.07.05-3.fc25.x86_64.rpm && \
  yum install -y /tmp/stress-ng-0.07.05-3.fc25.x86_64.rpm && \
  rm -f /tmp/stress-ng-0.07.05-3.fc25.x86_64.rpm && \
  yum install -y gcc && \
  cd /tmp/ && wget wget http://www.cs.virginia.edu/stream/FTP/Code/stream.c && \
  gcc -O /tmp/stream.c -o stream && mv /tmp/stream /usr/bin/ && \
  rm -f /tmp/stream.c && \
  yum clean all

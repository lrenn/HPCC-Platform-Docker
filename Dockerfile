# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.9.13

# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# install add-apt-repository
RUN sudo apt-get update
RUN sudo apt-get install -y software-properties-common python-software-properties

# we'll need wget to fetch the key...
RUN sudo apt-get install -y wget

RUN wget http://cdn.hpccsystems.com/releases/CE-Candidate-5.2.4/bin/platform/hpccsystems-platform-community_5.2.4-1trusty_amd64.deb
RUN sudo apt-get install -y g++ gcc make cmake bison flex binutils-dev libldap2-dev libcppunit-dev libicu-dev libxslt1-dev zlib1g-dev libboost-regex-dev libssl-dev libarchive-dev python2.7-dev libv8-dev openjdk-6-jdk libapr1-dev libaprutil1-dev libiberty-dev libhiredis-dev libtbb-dev default-jdk nodejs git expect zip
RUN dpkg -i hpccsystems-platform-community_5.2.4-1trusty_amd64.deb
RUN /etc/init.d/hpcc-init start; exit 0

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8010 8002
VOLUME [ "/var/log/HPCCSystems/" ]

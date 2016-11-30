FROM frolvlad/alpine-oraclejdk8
MAINTAINER Ian Nelson <in2rd.code@gmail.com>

# Install NiFi and clean-up afterwards
RUN     wget http://mirror.cogentco.com/pub/apache/nifi/1.0.0/nifi-1.1.0-bin.tar.gz && \
            tar zxvf nifi-1.1.0-bin.tar.gz && \
            mv nifi-1.1.0 /home/nifi && \
            rm nifi-1.1.0-bin.tar.gz

# Expose the UI/Tomcat port and 514 for syslog listening processor
EXPOSE  8080 514

# Expose configuration and repository folders
VOLUME  ["/home/nifi/conf", "/home/nifi/flowfile_repository", "/home/nifi/database_repository", "/home/nifi/content_repository", "/home/nifi/provenance_repository"]

# Start NiFi in foreground mode
CMD     /home/nifi/bin/nifi.sh run

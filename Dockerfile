FROM alpine:3.5
MAINTAINER Ian Nelson <in2rd.code@gmail.com>

# Install headless JDK from upstream
RUN     apk add --update openjdk8-jre-base

# Install NiFi and clean-up afterwards
RUN     wget http://archive.apache.org/dist/nifi/1.1.2/nifi-1.1.2-bin.tar.gz && \
            tar zxvf nifi-1.1.2-bin.tar.gz && \
            mv nifi-1.1.2 /home/nifi && \
            rm nifi-1.1.2-bin.tar.gz

# Set the Java home environment variable
RUN     export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

# Expose the UI/Tomcat port and 514 for syslog listening processor
EXPOSE  8080 514

# Expose configuration and repository folders
VOLUME  ["/home/nifi/conf", "/home/nifi/flowfile_repository", "/home/nifi/database_repository", "/home/nifi/content_repository", "/home/nifi/provenance_repository"]

# Start NiFi in foreground mode
CMD     /home/nifi/bin/nifi.sh run

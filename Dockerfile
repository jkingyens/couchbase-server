FROM ubuntu:12.04
RUN apt-get install -yq librtmp0 
ADD http://packages.couchbase.com/releases/2.2.0/couchbase-server-community_2.2.0_x86_64.deb /work/
RUN cd /work && dpkg -x couchbase-server-community_2.2.0_x86_64.deb .
RUN cd /work/opt && mv couchbase /opt 
EXPOSE 8091 8092 11210 11211
ENTRYPOINT ["/opt/couchbase/bin/couchbase-server", "--", "-noinput"]

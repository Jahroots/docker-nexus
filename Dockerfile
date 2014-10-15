FROM jahroots/java
MAINTAINER Jahroots "Jahroots@gmail.com"

RUN curl http://download.sonatype.com/nexus/oss/nexus-2.10.0-02-bundle.tar.gz \
    | tar xz

EXPOSE 8081
ENTRYPOINT ["/nexus-2.10.0-02/bin/jsw/linux-x86-64/wrapper",\
            "/nexus-2.10.0-02/bin/jsw/conf/wrapper.conf",\
            "wrapper.syslog.ident=nexus"]
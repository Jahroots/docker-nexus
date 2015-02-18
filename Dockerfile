FROM jahroots/java
MAINTAINER Jahroots "Jahroots@gmail.com"
ENV VERSION 2.11.2-03

RUN curl -LO https://sonatype-download.global.ssl.fastly.net/nexus/oss/nexus-$VERSION-bundle.tar.gz
RUN mv /nexus-$VERSION-bundle.tar.gz /opt && \
	cd /opt && \
	tar -xf nexus-$VERSION-bundle.tar.gz && \
	rm nexus-$VERSION-bundle.tar.gz && \
	mv nexus-$VERSION nexus
#RUN tar xz /nexus-$VERSION-bundle.tar.gz
#RUN mv nexus-$VERSION-bundle nexus

EXPOSE 8081
ENTRYPOINT ["/opt/nexus/bin/jsw/linux-x86-64/wrapper",\
            "/opt/nexus/bin/jsw/conf/wrapper.conf",\
            "wrapper.syslog.ident=nexus"]
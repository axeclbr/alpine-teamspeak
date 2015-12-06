FROM orimani/alpine-glibc

MAINTAINER Mat <mat@orimani.info>

ADD http://dl.4players.de/ts/releases/3.0.11.4/teamspeak3-server_linux-amd64-3.0.11.4.tar.gz /tmp/teamspeak.tar.gz

RUN mkdir /opt && \
  tar zxf /tmp/teamspeak.tar.gz -C /opt && \
  mv /opt/teamspeak3-server_* /opt/teamspeak && \
  rm /tmp/teamspeak.tar.gz && \
  addgroup -g 503 teamspeak && \
  adduser -u 503 -G teamspeak -h /opt/teamspeak -S -D teamspeak && \
  chown -R teamspeak:teamspeak /opt/teamspeak

EXPOSE 9987/udp 10011 30033

USER teamspeak

ENTRYPOINT ["/opt/teamspeak/ts3server_minimal_runscript.sh"]

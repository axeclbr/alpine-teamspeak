FROM orimani/alpine-glibc

MAINTAINER Mat <mat@orimani.info>

ENV TS_URL http://dl.4players.de/ts/releases/3.0.11.4/teamspeak3-server_linux-amd64-3.0.11.4.tar.gz

RUN apk --update add curl \
&& curl -L $TS_URL -o /tmp/teamspeak.tar.gz \
&& mkdir /opt \
&& tar zxf /tmp/teamspeak.tar.gz -C /opt \
&& mv /opt/teamspeak3-server_* /opt/teamspeak \
&& addgroup -g 503 teamspeak \
&& adduser -u 503 -G teamspeak -h /opt/teamspeak -S -D teamspeak \
&& chown -R teamspeak:teamspeak /opt/teamspeak \
&& apk del curl \
&& rm -rf \
   /tmp/teamspeak.tar.gz \
   /var/cache/apk*

EXPOSE 9987/udp 10011 30033

USER teamspeak

ENTRYPOINT ["/opt/teamspeak/ts3server_minimal_runscript.sh"]

# syntax=docker/dockerfile:1

FROM openjdk:17-jdk-buster

LABEL version="1.9.0"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Legend of the Eyes"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/71/71e309c0eb48620984c392f5ebbb1db980d2731b836f190dced8b9cb2e2e32bf.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://Legend-of-the-Eyes:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Legend of the Eyes v1.9.0 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]
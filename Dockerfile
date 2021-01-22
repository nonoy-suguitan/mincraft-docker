FROM ubuntu:latest

RUN apt -y update && apt -y install default-jre screen

RUN mkdir /usr/games/minecraft

WORKDIR /usr/games/minecraft

RUN wget -O minecraft_server.1.16.5.jar https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar

RUN java -Xmx1024M -Xms1024M -jar minecraft_server.1.16.5.jar nogui

RUN chown ubuntu eula.txt 

RUN echo "eula=true" > eula.txt

CMD java -Xmx1024M -Xms1024M -jar /usr/games/minecraft/minecraft_server.1.16.4.jar nogui

EXPOSE 25565
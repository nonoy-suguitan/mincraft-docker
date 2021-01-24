# Description
This page describes how to stand up a Minecraft server manually or via Docker.

# Prerequisites
* Use Ubuntu 18.x or higher
* Add custom TCP rule , open incoming port range 25565
* (For Docker only) Dockker needs to already be installed.
    * Refer to [how-to-install-docker.txt](https://github.com/Nonoy511/mincraft-docker/blob/master/how-to-install-docker.txt) for details.

# Launch Minecraft Server Manually
## Steps
1. Install necessary packages/dependencies.
```bash
sudo apt -y update && sudo apt -y install default-jre screen
```
2. Create a minecraft directory and CD into it.
```bash
sudo mkdir /usr/games/minecraft
cd /usr/games/minecraft
```
3. Get the latest minecraft server jar file from https://www.minecraft.net/en-us/download/server
```bash
#this link is for minecraft version 1.16.5, check the website to latest version
sudo wget -O minecraft_server.1.16.5.jar https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
```
4. Install Minecraft.
```bash
sudo java -Xmx1024M -Xms1024M -jar minecraft_server.1.16.5.jar nogui
```
5. Accept the EULA.
```bash
# change ownership of eula.txt if needed
sudo chown ubuntu eula.txt

# accept the EULA
echo "eula=true" > eula.txt
```
6. Run the Minecraft server.
```bash
sudo java -Xmx1024M -Xms1024M -jar /usr/games/minecraft/minecraft_server.1.16.5.jar nogui
```

# Launch Minecraft Server via Docker
## Steps
1. Execute
```bash
sudo docker run nonoysuguitan/minecraft:0.0.1
```

# TO DO
* auto update, get the latest minecraft version? or at least have the user pass in the minecraft version

* clean up hardcoded versions in dockerfile

* potentially use apline to make the image size smaller?
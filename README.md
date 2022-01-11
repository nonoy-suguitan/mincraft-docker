# Description
This page describes how to stand up a Minecraft server manually or via Docker.

# Prerequisites
* Use Amazon Linux 2
* Add custom TCP rule , open incoming port range 25565
* Reference: https://dev.to/julbrs/how-to-run-a-minecraft-server-on-aws-for-less-than-3-us-a-month-409p
* (For Docker only) Dockker needs to already be installed.
    * Refer to [how-to-install-docker.txt](https://github.com/Nonoy511/mincraft-docker/blob/master/how-to-install-docker.txt) for details.

# Launch Minecraft Server Manually
## Steps
1. Install necessary packages/dependencies.
```bash
sudo rpm --import https://yum.corretto.aws/corretto.key
sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
sudo yum install -y java-17-amazon-corretto-devel.x86_64
java --version
```
2. Create a minecraft directory and CD into it.
```bash
sudo mkdir /usr/games/minecraft
cd /usr/games/minecraft
```
3. Get the latest minecraft server jar file from https://www.minecraft.net/en-us/download/server
```bash
#this link is for minecraft version 1.18.1, check the website to latest version
sudo wget -O minecraft_server.1.18.1.jar https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar
```
4. Install Minecraft.
```bash
sudo java -Xmx2048M -Xms2048M -jar minecraft_server.1.18.1.jar nogui
```
5. Accept the EULA.
```bash
# change ownership of eula.txt if needed
sudo chown ec2-user eula.txt

# accept the EULA
echo "eula=true" > eula.txt
```
6. Run the Minecraft server.
```bash
sudo java -Xmx2048M -Xms2048M -jar /usr/games/minecraft/minecraft_server.1.18.1.jar nogui
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

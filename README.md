# Live Image Builder Debian with ClamAV (ClamTK)
## Description:
Live image Debian with Firefox, ClamTK, ClamAV, database ClamAV.

## Step 1:
Installing docker, go to the [docker site](https://docs.docker.com/engine/install/) and follow the instructions.
**Warning user must be in the docker group:**
```sh
sudo usermod -aG docker user
```
## Step 2:
Cloning repository:
```sh
git clone
chmod +x ./build_docker_container_image.sh
chmod +x ./build_live_clamav.sh
```
## Step 3:
Build an image of the container docker:
```sh
./build_docker_container_image.sh
```
## Step 4:
Build live ClamAV:
```sh
./build_live_clamav.sh
```
After answering a few questions and wait for the image assembly.
Ready image in the directory:
```
~/build_live_clamav
``` 

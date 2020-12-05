Run as (change the resolution and the volume you want to mount appropriately)

```sh
docker run --rm -p 6080:6080 -p 5900:5900 -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) -e RESOLUT=1920x1080 -v $(pwd):/home/ubuntu/shared mmonga/docker-eiffel
```

On the terminal you will get the info needed to connect to the VNC server: just follow the instructions. Something like:

```
Open your web browser with URL:
    http://localhost:6080/vnc.html?resize=downscale&autoconnect=1&password=3y7tlryM
or connect your VNC viewer to localhost:5900 with password 3y7tlryM

```

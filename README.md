Run as

```sh
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/home/eiffel mmonga/docker-eiffel
```

Under Mac OS or Windows you need to install a X server (for example,
[XQuartz](https://www.xquartz.org/),
[VcXsrv](https://sourceforge.net/projects/vcxsrv/), or
[MobaXterm](https://mobaxterm.mobatek.net/)).


Then use something like:

```sh
# MYIP contains the IP number of your host machine
export DISPLAY=$MYIP:0
xhost + $MYIP 
docker run -ti --rm -e DISPLAY=$DISPLAY -v $(pwd):/home/eiffel mmonga/docker-eiffel
```

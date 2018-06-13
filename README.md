Run as

```sh
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/home/eiffel mmonga/docker-eiffel:silab
```

Under Mac OS or Windows you need to install a X server (for example,
[XQuartz](https://www.xquartz.org/) or
[MobaXterm](https://mobaxterm.mobatek.net/)).


Then use something like:

```sh
export MYIP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
export DISPLAY=$MYIP:0
xhost + $MYIP 
docker run -ti --rm -e DISPLAY=$DISPLAY -v $(pwd):/home/eiffel mmonga/docker-eiffel:silab
```

This version matches the one installed in UNIMI labs.

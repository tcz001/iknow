# iknow
## Build

`docker build . -t iknow`

## Run Showcase

simply run docker container:

`docker run --name iknow -it iknow`

strace needs docker seccomp turned off:

`docker run --security-opt seccomp:unconfined --name iknow -it iknow`

fanotify needs SYS_ADMIN privileged

`docker run --privileged --cap-add SYS_ADMIN --name iknow -it iknow`

## Showcase

Run a shell on container:

`docker exec -it iknow /bin/bash`

Try access the demo file:

`touch pandora`

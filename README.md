# iknow
## Build

`docker build . -t iknow`

## Run Showcase

### inotify demo

simply run docker container:

`docker run --name iknow -it iknow`

`touch pandora && /tmp/workspace/tlpi/inotify/demo_inotify /tmp/workspace/demo/pandora`

### fanotify demo

fanotify needs SYS_ADMIN privileged:

`docker run --privileged --cap-add SYS_ADMIN --name iknow -it iknow`

`touch pandora && /tmp/workspace/fanotify/fanotify CLOSE "" /tmp/workspace/demo/pandora`

## Showcase

Run a shell on container:

`docker exec -it iknow /bin/bash`

Try access the demo file:

`touch pandora`

## Notes

strace needs docker seccomp turned off:
`docker run --security-opt seccomp:unconfined --name iknow -it iknow`

TAG=cheddar-latest
CHD=docker run --platform linux/amd64 --rm -e DISPLAY=host.docker.internal:0 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --security-opt apparmor=unconfined --privileged -ti $(TAG) 

c: 
	$(CHD) /bin/bash

r: 
	$(CHD) /usr/local/Cheddar-3.2-Linux32-bin/cheddar 

b: Dockerfile
	docker build -f $< --platform linux/amd64 -t $(TAG) .




UID := `id -u`
GID := `id -g`
UNAME := `id -un`
GNAME := `id -gn`
NAME := file-ubuntu20-${UNAME}
HOMEDIR := /home/${UNAME}
SSHPORT := 2022
PASSWORD := password

all:

build:
	docker build . --build-arg UNAME=${UNAME} --build-arg GNAME=${GNAME} --build-arg UID=${UID} --build-arg GID=${GID} --build-arg HOMEDIR=${HOMEDIR} -t ${NAME}

up:
	echo ${UNAME}:${PASSWORD} >./home/.password
	echo CONTAINER_NAME=${NAME} >./home/.container.sh
	docker run --name ${NAME} -d -p ${SSHPORT}:${SSHPORT} -v ./opt:/opt -v ./srv:/srv -v ./home:${HOMEDIR} -e UNAME=${UNAME} -e GNAME=${GNAME} -e UID=${UID} -e GID=${GID} -e HOMEDIR=${HOMEDIR} -e CONTAINER_NAME=${NAME} -e SSHPORT=${SSHPORT} ${NAME}

down:
	-docker kill ${NAME}
	-docker rm ${NAME}

sh:
	docker exec -it ${NAME} /usr/bin/su ${UNAME}

root:
	docker exec -it ${NAME} /bin/bash

ssh:
	ssh -XC localhost -p ${SSHPORT}

update:
	docker exec -it ${NAME} /usr/bin/su ${UNAME} -c ~${UNAME}/all.sh
	-mkdir lib
	cp home/_bin/libfile.a ../lib/
	cp home/file/magic/magic.mgc ../lib/
	cp home/file/src/magic.h ../lib/
	cp home/FileType.cpp ../src/
	cp home/FileType.h ../src/

clean:
	sh home/clean.sh
	cd lib ; make clean


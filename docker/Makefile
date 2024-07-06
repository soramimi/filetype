
all:

build:
	docker build . -t file

up:
	docker run --name file -d -v ./workspace:/workspace -p 2222:2222 file

down:
	docker kill file
	docker rm file

sh:
	docker exec -it file /usr/bin/bash

clean:
	rm -f file magic.mgc libmagic.so


SHELL := /bin/bash

NAME=todo.txt
VERSION=2.9

.PHONY: all clean prepare package_osx

all: clean package_deb

clean:
	rm -rf ./src/
	rm -rf ./build/
	rm -f $(NAME)*.pkg


prepare:
	mkdir ./src
	mkdir -p ./build/usr/local/bin
	mkdir -p ./build/etc
	wget -P ./src https://github.com/downloads/ginatrapani/todo.txt-cli/todo.txt_cli-$(VERSION).tar.gz
	tar xf ./src/todo.txt_cli-$(VERSION).tar.gz -C ./src/
	mv ./src/todo.txt_cli-$(VERSION)/todo.sh ./build/usr/local/bin/todo.sh
	patch ./build/usr/local/bin/todo.sh < ./patches/todo.patch 
	pushd ./build/usr/local/bin/; ln -s todo.sh t; popd
	cp ./cfg/todo.cfg ./build/etc/todo.cfg
	chmod +x ./build/usr/local/bin/todo.sh


package_osx: prepare
	fpm -s dir \
	    -t osxpkg \
	    -n $(NAME) \
	    -v $(VERSION) \
	    -a all \
	    --license GPLv3 \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --url "http://todotxt.com/" \
	    --config-files /etc/todo.cfg \
	    -d sed \
	    -d grep \
	    -C ./build usr etc


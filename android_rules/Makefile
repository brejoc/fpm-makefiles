SHELL := /bin/bash

NAME=android-device-rules
FILENAME=51-android.rules
VERSION=0.1

.PHONY: all clean prepare package_deb

all: clean package_deb

clean:
	rm -rf ./src/
	rm -rf ./build/
	rm -f $(PKG_NAME)*.deb


prepare:
	mkdir ./src
	mkdir -p ./build/etc/udev/rules.d/
	cp ./rules/$(FILENAME) ./build/etc/udev/rules.d/$(FILENAME)
	chmod 644 ./build/etc/udev/rules.d/$(FILENAME) 

package_deb: prepare
	fpm -s dir \
	    -t deb \
	    -n $(NAME) \
	    -v $(VERSION) \
	    -a all \
	    --license GPLv3 \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --url "http://webgarbage.de/" \
	    --deb-user root \
	    --deb-group root \
	    -C ./build \
	    etc

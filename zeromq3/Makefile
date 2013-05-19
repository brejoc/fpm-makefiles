SHELL := /bin/bash

NAME=libzmq3
VERSION=3.2.3
PKG_VERSION=$(VERSION)-1

.PHONY: all clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use either make package_deb or package_rpm"

clean:
	rm -rf ./src
	rm -rf ./build
	rm -f $(NAME)*.deb
	rm -f $(NAME)*.rpm

prepare:
	mkdir ./src
	mkdir ./build
	curl http://download.zeromq.org/zeromq-$(VERSION).tar.gz > ./src/zeromq.tar.gz
	pushd src; tar xf zeromq.tar.gz; popd;
	pushd src/zeromq-$(VERSION); ./configure && make && make install DESTDIR=../../../build/; popd;


package_deb: prepare
	fpm -s dir \
	    -t deb \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "LGPLv3+" \
	    -n $(NAME) \
	    -v $(PKG_VERSION) \
	    --deb-user root \
	    --deb-group root \
	    -C build \
	    usr

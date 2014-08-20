SHELL := /bin/bash

NAME=goaccess
PKG_NAME=$(NAME)
VERSION=0.8.3

.PHONY: all clean prepare package_deb

all: clean package_deb

clean:
	rm -rf ./src/
	rm -rf ./build/
	rm -f $(PKG_NAME)*.deb


prepare: clean
	mkdir ./src
	mkdir ./build
	curl http://tar.goaccess.io/goaccess-$(VERSION).tar.gz -o ./src/goaccess-$(VERSION).tar.gz
	pushd ./src; tar xf goaccess-$(VERSION).tar.gz; popd;
	pushd ./src/goaccess-$(VERSION)/; ./configure --enable-geoip --enable-utf8 --prefix /usr/local; make; make install DESTDIR=../../build; popd;


package_deb: prepare
	fpm -s dir \
	    -t deb \
	    -n $(PKG_NAME) \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "GPLv2" \
	    --description "`cat desc.txt`" \
	    --url "http://goaccess.io" \
	    --vendor "brejoc" \
	    -C ./build \
	    --config-files "/usr/local/etc/goaccess.conf" \
	    -d "libc6 (>= 2.14)" \
	    -d "libglib2.0-0 (>= 2.12.0)" \
	    -d "libncurses5 (>= 5.5-5~)" \
	    -d "libtinfo5" \
	    usr

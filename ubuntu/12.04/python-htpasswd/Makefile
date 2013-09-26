SHELL := /bin/bash

PKG_NAME=python-htpasswd
DOWNLOAD_URL=http://trac.edgewall.org/export/11846/trunk/contrib/htpasswd.py
PKG_VERSION=20080305~brejoc1

.PHONY: all desc clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use either make package_deb or package_rpm"

clean:
	rm -rf ./src/
	rm -rf ./build/
	rm -f $(PKG_NAME)*.deb
	rm -f $(PKG_NAME)*.rpm

prepare:
	mkdir ./src
	mkdir -p ./build/usr/local/bin
	curl -o ./src/htpasswd.py $(DOWNLOAD_URL)	
	cp ./src/htpasswd.py ./build/usr/local/bin/htpasswd
	chmod +x ./build/usr/local/bin/htpasswd

package_deb: clean prepare
	fpm -s dir \
	    -t deb \
	    -n $(PKG_NAME) \
	    -v $(PKG_VERSION) \
	    -a all \
            -m "Jochen Breuer <brejoc@gmail.com>" \
            --license "BSD" \
            -v $(PKG_VERSION) \
            --deb-user root \
            --deb-group root \
            -d "python2.7" \
	    -d "python-crypto" \
	    -C ./build \
	    usr

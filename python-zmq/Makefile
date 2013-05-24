SHELL := /bin/bash

NAME=pyzmq
PKG_NAME=python-zmq
VERSION=13.1.0

.PHONY: all clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use either make package_deb or package_rpm"

clean:
	rm -f $(PKG_NAME)*.deb
	rm -f $(PKG_NAME)*.rpm

prepare:
	# nothing to do here
	# An other method would be this:
	# pip install --install-option="--prefix=./build/usr/" --install-option="--zmq=/usr/lib/" pyzmq

package_deb: prepare
	fpm -s python \
	    -t deb \
            -n $(PKG_NAME) \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "LGPL+BSD" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
            -d "python (>= 2.7.1-0ubuntu2)" \
            -d "python (<< 2.8)" \
            -d "libzmq3" \
	    $(NAME)

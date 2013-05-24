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
	rm -f python-$(NAME)*.deb
	rm -f python-$(NAME)*.rpm

prepare:
	# nothing to do here

package_deb: prepare
	fpm -s python \
	    -t deb \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "LGPL+BSD" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
	    -d "python2.7" \
	    $(NAME)

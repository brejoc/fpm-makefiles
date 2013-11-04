SHELL := /bin/bash

NAME=gcm-client
VERSION=0.1.4

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
	    --license "Apache 2.0" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
	    --no-python-dependencies \
	    -d "python2.7" \
            -d "python (>=2.7.1-0ubuntu2)" \
            -d "python (<<2.8)" \
	    -d "python-requests" \
	    $(NAME)

SHELL := /bin/bash

NAME=uWSGI
NAME_LOWER=$(shell echo $(NAME) | tr "A-Z" "a-z")
VERSION=2.0
ARCH=$(shell uname -m)

.PHONY: all clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use either make package_deb or package_rpm"

clean:
	rm -f python-${NAME_LOWER}*.deb

prepare:
	# nothing to do here

package_deb: prepare
	fpm -s python \
	    -t deb \
	    -a $(ARCH) \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "GPL2" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
            -d "python2.7" \
            -d "python (>=2.7.1-0ubuntu2)" \
            -d "python (<<2.8)" \
	    $(NAME)

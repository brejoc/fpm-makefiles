SHELL := /bin/bash

NAME=cabin
VERSION=0.6.1

.PHONY: all clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: make package_deb"

clean:
	rm -f rubygem-$(NAME)*.deb
	rm -f rubygem-$(NAME)*.rpm

prepare:
	# nothing to do here

package_deb: prepare
	fpm -s gem \
	    -t deb \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
            -d "ruby1.8 (>= 0)" \
            -d "rubygems1.8 (>= 1.8.15)" \
	    $(NAME)

SHELL := /bin/bash

NAME=clamp
VERSION=0.3.1

.PHONY: all clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use either make package_deb or package_rpm"

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

package_rpm: prepare
	fpm -s gem \
	    -t rpm \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    -v $(VERSION) \
	    --rpm-user root \
	    --rpm-group root \
            -d "ruby1.8 (>= 0)" \
            -d "rubygems1.8 (>= 1.8.15)" \
	    $(NAME)

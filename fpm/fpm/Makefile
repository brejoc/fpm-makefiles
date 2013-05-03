SHELL := /bin/bash

NAME=fpm
VERSION=0.4.29

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
	    $(NAME)

package_rpm: prepare
	fpm -s gem \
	    -t rpm \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    -v $(VERSION) \
	    --rpm-user root \
	    --rpm-group root \
	    $(NAME)

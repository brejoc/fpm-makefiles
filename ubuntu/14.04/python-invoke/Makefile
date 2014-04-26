SHELL := /bin/bash

NAME=invoke
VERSION=0.7.0

.PHONY: all clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use either make package_deb or package_rpm"

clean:
	rm -f python-$(NAME)*.deb

prepare:
	# nothing to do here

package_deb: clean prepare
	fpm -s python \
	    -t deb \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "BSD" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
            -d "python2.7" \
            -d "python (>=2.7.5)" \
            -d "python (<<2.8)" \
	    $(NAME)

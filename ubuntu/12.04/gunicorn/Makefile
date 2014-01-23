SHELL := /bin/bash

NAME=gunicorn
VERSION=18

.PHONY: all clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use either make package_deb or package_rpm"

clean:
	rm -f $(NAME)*.deb
	rm -f $(NAME)*.rpm

prepare:
	# nothing to do here

package_deb: prepare
	fpm -s python \
	    -t deb \
	    -n "$(NAME)" \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "MIT" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
            -d "python (>= 2.6)" \
            -d "python-support (>= 0.90.0)" \
	    -d "python-pkg-resources" \
	    -d "python-setuptools" \
	    $(NAME)

package_rpm: prepare
	fpm -s python \
	    -t rpm \
	    -n "$(NAME)" \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "MIT" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
            -d "python (>= 2.6)" \
            -d "python-support (>= 0.90.0)" \
	    -d "python-pkg-resources" \
	    -d "python-setuptools" \
	    $(NAME)

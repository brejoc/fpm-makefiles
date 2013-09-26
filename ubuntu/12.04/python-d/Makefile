SHELL := /bin/bash

NAME=d
VERSION=0.2.0
PKG_VERSION=$(VERSION)~brejoc1

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
	    --license "MIT" \
	    -v $(PKG_VERSION) \
	    --deb-user root \
	    --deb-group root \
            -d "python-markdown" \
	    -d "python-pygments (>=1.4)" \
	    -d "python-pyquery (>=1.0-1)" \
            -d "python (>=2.7.1-0ubuntu2)" \
            -d "python (<<2.8)" \
	    $(NAME)

package_rpm: prepare
	fpm -s python \
	    -t rpm \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "MIT" \
	    -v $(PKG_VERSION) \
	    --rpm-user root \
	    --rpm-group root \
	    -d "python-markdown" \
	    -d "python-pygments (>=1.4)" \
	    -d "python-pyquery (>=1.0-1)" \
            -d "python (>=2.7.1-0ubuntu2)" \
            -d "python (<<2.8)" \
	    $(NAME)

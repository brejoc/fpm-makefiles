SHELL := /bin/bash

NAME=yamlish
VERSION=0.10

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
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
	    -d "python2.7" \
	    -d "python-yaml (>=3.09)" \
	    $(NAME)

package_rpm: prepare
	fpm -s python \
	    -t rpm \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "MIT" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
	    -d "python2.7" \
	    -d "python-yaml (>=3.09)" \
	    $(NAME)

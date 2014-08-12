SHELL := /bin/bash

NAME=pytodoist
VERSION=0.5

.PHONY: all clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use make package_deb"

clean:
	rm -f python-$(NAME)*.deb

prepare:
	# nothing to do here

package_deb: prepare
	# requirements see here: https://github.com/Garee/PyTodoist/blob/master/requirements.txt
	# python package in Ubuntu already provides argparse and wsgiref.
	fpm -s python \
	    -t deb \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "MIT" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
	    -d "python2.7" \
            -d "python (>=2.7.1-0ubuntu2)" \
            -d "python (<<2.8)" \
	    -d "python-requests (>=2.2.1)" \
	    $(NAME)

SHELL := /bin/bash

NAME=backports
VERSION=2.6.2

.PHONY: all clean prepare package_osx
.SILENT: desc

all: desc

desc:
	echo "usage: please use 'make package_osx'"

clean:
	rm -f rubygem-$(NAME)*.pkg

prepare:
	# nothing to do here

package_osx: prepare
	fpm -s gem \
	    -t osxpkg \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    -v $(VERSION) \
	    $(NAME)

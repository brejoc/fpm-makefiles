SHELL := /bin/bash

NAME=open4
VERSION=1.3.0

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
            -d "ruby1.8 (>= 0)" \
            -d "rubygems1.8 (>= 1.8.15)" \
	    $(NAME)

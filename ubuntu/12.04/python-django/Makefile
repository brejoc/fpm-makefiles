SHELL := /bin/bash

NAME=Django
VERSION=1.6.1

.PHONY: all clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use make package_deb"

clean:
	rm -f python-django*.deb

prepare:
	# nothing to do here

package_deb: prepare
	fpm -s python \
	    -t deb \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
	    -d "python-yaml" \
	    -d "python-sqlite (>= 1.0.1)" \
	    -d "python-mysqldb (>= 1.2.3)" \
	    -d "python-imaging (>= 1.1.7)" \
	    -d "python2.7" \
            -d "python (>=2.7.1-0ubuntu2)" \
            -d "python (<<2.8)" \
	    $(NAME)

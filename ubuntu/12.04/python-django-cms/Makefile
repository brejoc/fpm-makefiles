SHELL := /bin/bash

NAME=django-cms
VERSION=2.4.3

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
	fpm -s python \
	    -t deb \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "BSD" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
	    --no-auto-depends \
	    -d "python-django (>= 1.4)" \
	    -d "python-django (<< 1.6)" \
	    -d "python-django-classy-tags (>= 0.3.4.1)" \
	    -d "python-django-south (>= 0.7.2)" \
	    -d "python-html5lib" \
	    -d "python-django-mptt (>= 0.5.1)" \
	    -d "python-django-mptt (<< 0.5.3)" \
	    -d "python-django-sekizai (>= 0.7)" \
	    -d "python2.7" \
            -d "python (>=2.7.1-0ubuntu2)" \
            -d "python (<<2.8)" \
	    $(NAME)

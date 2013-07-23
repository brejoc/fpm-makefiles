SHELL := /bin/bash

NAME=grappelli
PKG_NAME=python-$(NAME)-alternate
VERSION=2.4.5
PKG_VERSION=$(VERSION)-dajool2

.PHONY: all desc clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use either make package_deb or package_rpm"

clean:
	rm -rf ./src/
	rm -rf ./build/
	rm -f $(PKG_NAME)*.deb

prepare:
	mkdir ./src
	mkdir -p ./build/usr/local/alternate/$(NAME)-$(VERSION)
	wget -O ./src/$(NAME).tar.gz https://pypi.python.org/packages/source/d/django-grappelli/django-grappelli-2.4.5.tar.gz
	pushd ./src; tar xf $(NAME).tar.gz; popd;
	pushd ./src/django-grappelli-2.4.5/grappelli/; cp -R * ../../../build/usr/local/alternate/$(NAME)-$(VERSION)/.; popd;

package_deb: clean prepare
	fpm -s dir \
	    -t deb \
	    -n $(PKG_NAME) \
	    -v $(PKG_VERSION) \
	    -a all \
	    --license BSD \
	    -m "Jochen Breuer <breuer@dajool.com>" \
	    --url "http://dajool.com/" \
	    --before-remove ./scripts/pre_uninstall \
            -d "python2.7" \
            -d "python (>=2.7.1-0ubuntu2)" \
            -d "python (<<2.8)" \
	    --deb-user root \
	    --deb-group root \
	    -C ./build usr

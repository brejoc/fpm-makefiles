SHELL := /bin/bash

NAME=grappelli
VERSION=2.4.6
PKG_NAME=python-$(NAME)-$(VERSION)-alternate
PKG_VERSION=$(VERSION)-dajool3


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
	wget -O ./src/$(NAME).tar.gz https://pypi.python.org/packages/source/d/django-grappelli/django-grappelli-$(VERSION).tar.gz
	pushd ./src; tar xf $(NAME).tar.gz; popd;
	pushd ./src/django-grappelli-$(VERSION)/grappelli/; cp -R * ../../../build/usr/local/alternate/$(NAME)-$(VERSION)/.; popd;

package_deb: clean prepare
	fpm -s dir \
	    -t deb \
	    -n $(PKG_NAME) \
	    -v $(PKG_VERSION) \
	    -a all \
	    --license BSD \
	    -m "Jochen Breuer <breuer@dajool.com>" \
	    --url "http://dajool.com/" \
	    --after-install ./scripts/after_install \
	    --before-remove ./scripts/pre_uninstall \
            -d "python2.7" \
            -d "python (>=2.7.1-0ubuntu2)" \
            -d "python (<<2.8)" \
	    --deb-user root \
	    --deb-group root \
	    -C ./build usr

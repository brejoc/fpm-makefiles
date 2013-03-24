SHELL := /bin/bash

NAME=schematics
PKG_NAME=python-$(NAME)
REVISION=b856ffba5f9cb928dd58ed90524bd819715bed26
VERSION=0.5.git.$(REVISION)
GIT_REPO=https://github.com/j2labs/schematics.git
PYTHON_INSTALL_DIR=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`

.PHONY: all clean package_deb package_rpm prepare

all: clean package_deb

clean:
	rm -rf ./build
	rm -rf ./src
	rm -f python-$(NAME)*.deb
	rm -f python-$(NAME)*.rpm

prepare:
	mkdir ./src
	mkdir ./build
	git clone $(GIT_REPO) src/schematics
	pushd ./src/schematics/; git checkout $(REVISION); popd;
	mkdir -p ./build$(PYTHON_INSTALL_DIR)
	cp -r ./src/schematics/schematics ./build$(PYTHON_INSTALL_DIR)/.
	

package_deb: prepare
	fpm -s dir -t deb -n $(PKG_NAME) -v $(VERSION) -a all --license "Copyright 2012 J2 Labs LLC. All rights reserved." --description "Python Data Structures for Humans." -m "Jochen Breuer <brejoc@gmail.com>" --url "https://github.com/j2labs/schematics" --deb-user root --deb-group root  -C ./build usr

package_rpm: prepare
	fpm -s dir -t rpm -n $(PKG_NAME) -v $(VERSION) -a all --license "Copyright 2012 J2 Labs LLC. All rights reserved." --description "Python Data Structures for Humans." -m "Jochen Breuer <brejoc@gmail.com>" --url "https://github.com/j2labs/schematics" --rpm-user root --rpm-group root  -C ./build usr

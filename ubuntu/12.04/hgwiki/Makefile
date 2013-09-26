SHELL := /bin/bash

NAME=mercurial-wiki
PKG_NAME=python-mercurial-wiki
REVISION=c64043853df20a7c759e9763337f9b68986cb68a
VERSION=0.1~hg20130319-precise1
USERNAME=brejoc

.PHONY: all desc clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use either make package_deb or package_rpm"

clean:
	rm -rf ./src/
	rm -rf ./build/
	rm -f $(PKG_NAME)_*_all.deb
	rm -f $(PKG_NAME)-*.noarch.rpm
	rm -f python-bottle-*.noarch.rpm

prepare:
	mkdir ./src
	mkdir -p ./build/usr/local/bin
	mkdir -p ./build/usr/local/mercurial-wiki
	mkdir -p ./build/usr/local/share/mercurial-wiki
	hg clone -r $(REVISION) https://bitbucket.org/$(USERNAME)/mercurial-wiki src/mercurial-wiki/
	cp ./src/mercurial-wiki/hgwiki.py ./src/mercurial-wiki/util.py ./build/usr/local/mercurial-wiki/
	patch ./build/usr/local/mercurial-wiki/hgwiki.py ./patches/hgwiki.py.patch
	chmod +x ./build/usr/local/mercurial-wiki/hgwiki.py
	cp -r ./src/mercurial-wiki/creole ./build/usr/local/mercurial-wiki/
	cp -r ./src/mercurial-wiki/static ./src/mercurial-wiki/views ./build/usr/local/share/mercurial-wiki/
	pushd ./build/usr/local/bin; ln -s ../mercurial-wiki/hgwiki.py hgwiki; popd;

package_dep_rpm:
	fpm -s python -t rpm bottle

package_deb: clean prepare
	fpm -s dir -t deb -n $(PKG_NAME) -v $(VERSION) -a all --license GPLv3 -m "Jochen Breuer <brejoc@gmail.com>" --url "http://webgarbage.de/" --deb-user root --deb-group root -d python-bottle -d python-jinja2 -C ./build usr

package_rpm: clean prepare package_dep_rpm
	fpm -s dir -t rpm -n $(PKG_NAME) -v $(VERSION) -a all --license GPLv3 -m "Jochen Breuer <brejoc@gmail.com>" --url "http://webgarbage.de/" --rpm-user root --rpm-group root -d python-bottle -d python-jinja2 -C ./build usr

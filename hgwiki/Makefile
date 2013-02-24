SHELL := /bin/bash

NAME=mercurial-wiki
PKG_NAME=python-mercurial-wiki
VERSION=0.1
REVISION=fcfa31643594b18d9cbd7dd3e64899270a37cc02
USERNAME=brejoc

.PHONY: all clean prepare package_deb

all: clean package_deb

clean:
	rm -rf ./src/
	rm -rf ./build/
	rm -f $(PKG_NAME)_$(VERSION)_all.deb


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


package_deb: prepare
	fpm -s dir -t deb -n $(PKG_NAME) -v $(VERSION) -a all --license GPLv3 -m "Jochen Breuer <brejoc@gmail.com>" --url "http://webgarbage.de/" --deb-user root --deb-group root -d python-bottle -d python-jinja2 -C ./build usr

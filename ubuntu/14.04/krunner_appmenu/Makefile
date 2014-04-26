SHELL := /bin/bash

NAME=plasma-runners-appmenu
PKG_NAME=$(NAME)
REVISION=211069cf496eb81e36cee0c1393d022ce4d4c5b5
DATE_OF_REV=20130207
PKG_VERSION=0.1~git$(DATE_OF_REV)-brejoc1

.PHONY: all clean prepare package_deb

all: clean package_deb

clean:
	rm -rf ./src/
	rm -rf ./build/
	rm -f $(PKG_NAME)*.deb


prepare: clean
	mkdir ./src
	mkdir ./build
	git clone git://anongit.kde.org/scratch/afiestas/appmenu.git src/appmenu
	pushd ./src/appmenu/; git checkout $(REVISION); mkdir builddir; pushd builddir; cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`; make; make install DESTDIR=../../../build; popd; popd;


package_deb: prepare
	fpm -s dir \
	    -t deb \
	    -n $(PKG_NAME) \
	    -v $(PKG_VERSION) \
	    --license "GPLv2" \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --description "HUD-like functionality for KDE/Krunner." \
	    --url "http://webgarbage.de" \
	    --deb-user root \
	    --deb-group root \
	    -C ./build \
	    -d "appmenu-qt" \
	    usr

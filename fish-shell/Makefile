SHELL := /bin/bash

NAME=fish-shell
PKG_NAME=fish
REVISION=6496adf101d6cd04b2d579509454c17f1965281f
VERSION=1.23.git.$(REVISION)

.PHONY: all clean prepare package_deb

all: clean package_deb

clean:
	rm -rf ./src/
	rm -rf ./build/
	rm -f $(PKG_NAME)*.deb
	rm -f $(PKG_NAME)*.rpm


prepare: clean
	mkdir ./src
	mkdir ./build
	git clone https://github.com/fish-shell/fish-shell.git src/fish-shell	
	# BSD would use gmake instead of make
	pushd ./src/fish-shell/; autoconf; ./configure --prefix=/usr; make; make install DESTDIR=../../build; popd;


package_deb: prepare
	# dependencies: xsel
	fpm -s dir \
	    -t deb \
	    -n $(PKG_NAME) \
	    -v $(VERSION) \
	    -C ./build \
	    --config-files "/etc/fish/config.fish" \
	    -d "xsel" \
	    usr

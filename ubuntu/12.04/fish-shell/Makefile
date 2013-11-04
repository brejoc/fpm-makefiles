SHELL := /bin/bash

NAME=fish-shell
PKG_NAME=fish
REVISION=6d542b8bb0ea96424af6eaf952ee89fc846f622a
DATE_OF_REV=20131103
PKG_VERSION=2.1.0~git$(DATE_OF_REV)-brejoc1

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
	fpm -s dir \
	    -t deb \
	    -n $(PKG_NAME) \
	    -v $(PKG_VERSION) \
	    --deb-user root \
	    --deb-group root \
	    -C ./build \
	    --config-files "/etc/fish/config.fish" \
	    -d "xsel" \
	    -d "libc6" \
	    -d "lynx" \
	    -d "bc" \
	    -d "gettext" \
	    usr

package_rpm: prepare
	fpm -s dir \
	    -t rpm \
	    -n $(PKG_NAME) \
	    -v $(PKG_VERSION) \
	    --rpm-user root \
	    --rpm-group root \
	    -C ./build \
	    --config-files "/etc/fish/config.fish" \
	    -d "xsel" \
	    -d "libc6" \
	    -d "lynx" \
	    -d "bc" \
	    -d "gettext" \
	    usr

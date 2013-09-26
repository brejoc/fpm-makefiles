NAME=ssht
REVISION=9f2752816da6102c86fee14bf3685c0d8046eeb8
VERSION=0.1.hg.$(REVISION)

.PHONY: all clean package_osx prepare

all: clean package_deb clean package_rpm

clean:
	rm -f *.pkg
	rm -f ./ssht

prepare:
	wget https://bitbucket.org/brejoc/misc/raw/$(REVISION)/ssh/ssht
	chmod +x ssht

package_osx: prepare
	fpm -s dir \
	    -t osxpkg \
	    -n $(NAME) \
	    -v $(VERSION) \
	    -a all \
	    --license GPLv3 \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --url "http://webgarbage.de/" \
	    --prefix /usr/local/bin \
	    ssht

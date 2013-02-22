NAME=ssht
VERSION=9f2752816da6102c86fee14bf3685c0d8046eeb8

.PHONY: all clean package

all: clean package

clean:
	rm -f ./ssht
	rm -f *.deb

package:
	wget https://bitbucket.org/brejoc/misc/raw/$(VERSION)/ssh/ssht
	chmod +x ssht
	fpm -s dir -t deb -n $(NAME) -v $(VERSION) -a all --license GPLv3 -m "Jochen Breuer <brejoc@gmail.com>" --url "http://webgarbage.de/" --deb-user root --deb-group root --prefix /usr/local/bin ssht

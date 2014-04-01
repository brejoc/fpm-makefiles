NAME=ssht
REVISION=adfacf4b043bfcc627cfa52a9c2ab3464227b5d9
VERSION=0.2.hg.$(REVISION)

.PHONY: all clean package_deb package_rpm prepare

all: clean package_deb clean package_rpm

clean:
	rm -f ./ssht
	rm -f *.deb
	rm -f *.rpm

prepare:
	wget https://bitbucket.org/brejoc/misc/raw/$(REVISION)/ssh/ssht
	chmod +x ssht

package_deb: prepare
	fpm -s dir -t deb -n $(NAME) -v $(VERSION) -a all --license GPLv3 -m "Jochen Breuer <brejoc@gmail.com>" --url "http://webgarbage.de/" --deb-user root --deb-group root --prefix /usr/local/bin ssht

package_rpm: prepare
	fpm -s dir -t rpm -n $(NAME) -v $(VERSION) -a all --license GPLv3 -m "Jochen Breuer <brejoc@gmail.com>" --url "http://webgarbage.de/" --rpm-user root --rpm-group root --prefix /usr/local/bin ssht

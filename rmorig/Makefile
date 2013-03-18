NAME=rmorig
REVISION=bbb1e43c3d59c9fc75a4c502c3ae7bb453f9982e
VERSION=0.1
USERNAME=brejoc

.PHONY: all clean package_deb package_rpm prepare

all: clean package_deb

clean:
	rm -f ./rmorig
	rm -f *.deb
	rm -f *.rpm

prepare:
	wget https://bitbucket.org/$(USERNAME)/misc/raw/$(REVISION)/mercurial/rmorig
	chmod +x rmorig

package_deb: prepare
	fpm -s dir -t deb -n $(NAME) -v $(VERSION) -a all --license GPLv3 -m "Jochen Breuer <brejoc@gmail.com>" --url "http://webgarbage.de/" --deb-user root --deb-group root --prefix /usr/local/bin rmorig

package_rpm: prepare
	fpm -s dir -t rpm -n $(NAME) -v $(VERSION) -a all --license GPLv3 -m "Jochen Breuer <brejoc@gmail.com>" --url "http://webgarbage.de/" --rpm-user root --rpm-group root --prefix /usr/local/bin rmorig

SHELL := /bin/bash

NAME=nopriv
PKG_NAME=$(NAME)
REVISION=feec1046f4f82e6eac8289763e58076c96bed484
VERSION=0.1.git.$(REVISION)
#GIT_REPO=https://github.com/RaymiiOrg/NoPriv.git
GIT_REPO=https://github.com/brejoc/NoPriv.git
PYTHON_INSTALL_DIR=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`

.PHONY: all clean package_deb package_rpm prepare

all: clean package_deb

clean:
	rm -rf ./build
	rm -rf ./src
	rm -f $(NAME)*.deb
	rm -f $(NAME)*.rpm

prepare:
	mkdir ./src
	mkdir ./build
	git clone $(GIT_REPO) src/nopriv
	pushd ./src/nopriv/; git checkout $(REVISION); popd;
	mkdir -p ./build/usr/local/bin/
	mkdir -p ./build/usr/local/share/nopriv/
	mkdir -p ./build/etc/
	cp ./src/nopriv/nopriv.py ./build/usr/local/bin/.
	cp ./src/nopriv/nopriv.ini ./build/etc/.
	cp -r ./src/nopriv/inc ./build/usr/local/share/nopriv/.
	patch ./build/usr/local/bin/nopriv.py ./patches/nopriv.py.patch
	mv ./build/usr/local/bin/nopriv.py ./build/usr/local/bin/nopriv
	chmod +x ./build/usr/local/bin/nopriv
	

package_deb: prepare
	fpm -s dir -t deb -n $(PKG_NAME) -v $(VERSION) -a all --license "GPLv3" --description "NoPriv.py is a python script to backup any IMAP capable email account to a HTML archive." -m "Jochen Breuer <brejoc@gmail.com>" --url "https://github.com/RaymiiOrg/NoPriv" --deb-user root --deb-group root --config-files "/etc/nopriv.ini"  -C ./build usr etc

package_rpm: prepare
	fpm -s dir -t rpm -n $(PKG_NAME) -v $(VERSION) -a all --license "GPLv3" --description "NoPriv.py is a python script to backup any IMAP capable email account to a HTML archive." -m "Jochen Breuer <brejoc@gmail.com>" --url "https://github.com/RaymiiOrg/NoPriv" --rpm-user root --rpm-group root --config-files "/etc/nopriv.ini" -C ./build usr etc

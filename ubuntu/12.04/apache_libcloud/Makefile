SHELL := /bin/bash

NAME=apache-libcloud
VERSION=0.12.3

.PHONY: all clean package_deb package_rpm prepare
.SILENT: desc

all: desc

desc:
	echo "usage: please use either make package_deb or package_rpm"

clean:
	rm -f python-$(name)*.deb
	rm -f python-$(name)*.rpm

prepare:
	# nothing to prepare

package_deb: prepare
	fpm -s python -t deb -v $(VERSION) -m "Jochen Breuer <brejoc@gmail.com>" --deb-user root --deb-group root -d python2.7 -d python-simplejson -d 'python (<< 2.8)' $(NAME)

package_rpm: prepare
	# not tested yet 
	# fpm -s python -t rpm -v $(VERSION) -m "Jochen Breuer <brejoc@gmail.com>" --rpm-user root --rpm-group root -d python2.7 -d python-simplejson -d 'python (<< 2.8)' $(NAME)

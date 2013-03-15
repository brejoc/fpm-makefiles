SHELL := /bin/bash

NAME=beanstalkc
VERSION=0.3.0

.PHONY: all clean prepare package_deb

all: clean package_deb

clean:
	rm -f *.deb

prepare:
	# nothing to do here

package_deb: prepare
	fpm -s python -t deb -m "Jochen Breuer <brejoc@gmail.com>" --license "Apache License Version 2.0" -v $(VERSION) -d python-yaml $(NAME)

package_rpm: prepare
	fpm -s python -t rpm -m "Jochen Breuer <brejoc@gmail.com>" --license "Apache License Version 2.0" -v $(VERSION) -d python-yaml $(NAME)

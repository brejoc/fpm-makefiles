SHELL := /bin/bash

NAME=dajool-jenkins-slave
VERSION=0.2

.PHONY: all clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: make package_deb"

clean:
	rm -f $(NAME)*.deb

prepare:
	# nothing to do here


package_deb: prepare
	fpm -s dir \
            -n $(NAME) \
            -t deb \
            -v $(VERSION) \
	    -a all \
            --deb-user root \
            --deb-group root \
            -m "Jochen Breuer <brejoc@gmail.com>" \
            --url "http://webgarbage.de/" \
            --description "Meta package that installs all dependencies needed for jenkins master build slave." \
            --license "MIT" \
            --no-python-dependencies \
            -d "openjdk-7-jdk" \
            -d "jenkins-slave" \
            -d "salt-minion" \
            -d "build-essential" \
            -d "mercurial" \
            -d "git" \
            -d "subversion" \
            -d "cvs" \
            -d "python-invoke" \
            -d "python-jinja2" \
            -d "python-dev" \
	    -d "python-setuptools" \
            -d "ruby-dev" \
            -d "rubygem-fpm" \
	    -d "autoconf" \
	    -d "libncurses5-dev" \
            --prefix /etc \
            buildserver-jenkins-slave

SHELL := /bin/bash

NAME=buildserver-jenkins-master
VERSION=0.1

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
	    --description "Meta package that installs all dependencies needed for jenkins master build server." \
	    --license "MIT" \
	    --no-python-dependencies \
	    -d "openjdk-7-jdk" \
	    -d "jenkins" \
            -d "salt-minion" \
            -d "build-essential" \
	    -d "mercurial" \
	    -d "git" \
	    -d "svn" \
	    -d "cvs" \
	    -d "python-invoke" \
	    -d "python-jinja2" \
	    -d "python-dev" \
	    -d "ruby-dev" \
	    -d "rubygem-fpm" \
	    --prefix /etc \
	    buildserver-jenkins-master

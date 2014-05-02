SHELL := /bin/bash

NAME=hybrid-sleep
VERSION=0.1

.PHONY: all desc clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use make package_deb"

clean:
	rm -rf ./build
	rm -f $(NAME)_*_all.deb

prepare:
	cp -R ./local_src ./build
	chmod 744 ./build/etc/pm/config.d/00-use-suspend-hybrid
	chmod +x ./build/etc/pm/config.d/00-use-suspend-hybrid

package_deb: prepare
	fpm -s dir \
	    -t deb \
	    -n $(NAME) \
	    -v $(VERSION) \
	    -a all \
	    --license "GPLv3" \
	    --description "Enables true hybrid suspend." \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --url "http://webgarbage.de/" \
            --config-files /etc/pm/config.d/00-use-suspend-hybrid \
	    --deb-user root \
	    --deb-group root \
	    -C ./build etc

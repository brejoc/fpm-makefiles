SHELL := /bin/bash

NAME=fstrim-cron
VERSION=0.2

.PHONY: all desc clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use either make package_deb or package_rpm"

clean:
	rm -rf ./build
	rm -f $(NAME)_*_all.deb

prepare:
	cp -R ./local_src ./build
	chmod 744 ./build/etc/cron.daily/fstrim

package_deb: prepare
	fpm -s dir \
	    -t deb \
	    -n $(NAME) \
	    -v $(VERSION) \
	    -a all \
	    --license "GPLv3" \
	    --description "Provides a daily cron job to perform fstrim on the root partition." \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --url "http://webgarbage.de/" \
	    --deb-user root \
	    --deb-group root \
	    -d "util-linux (>= 2.20.1-1)" \
	    -C ./build etc

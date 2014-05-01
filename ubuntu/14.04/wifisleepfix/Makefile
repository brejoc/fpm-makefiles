SHELL := /bin/bash

NAME=wifi-sleep-fix
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
	chmod 744 ./build/etc/pm/sleep.d/wifisleepfix.sh
	chmod +x ./build/etc/pm/sleep.d/wifisleepfix.sh

package_deb: prepare
	fpm -s dir \
	    -t deb \
	    -n $(NAME) \
	    -v $(VERSION) \
	    -a all \
	    --license "GPLv3" \
	    --description "Ugly fix for failing wifi after sleep." \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --url "http://webgarbage.de/" \
            --config-files /etc/pm/sleep.d/wifisleepfix.sh \
	    --deb-user root \
	    --deb-group root \
	    -C ./build etc

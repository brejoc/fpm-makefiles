SHELL := /bin/bash

NAME=upgrade_mailerpy
PKG_NAME=python-upgrade-mailer
REVISION=0a2da7269b02710784558e15d11a5c056edf1d35
VERSION=0.1.hg.$(REVISION)~brejoc1


.PHONY: all clean prepare package_deb

all: clean package_deb

clean:
	rm -rf ./src/
	rm -rf ./build/
	rm -f $(PKG_NAME)_$(VERSION)_all.deb


prepare:
	mkdir ./src
	mkdir -p ./build/usr/local/bin
	mkdir -p ./build/etc
	wget -P ./src https://bitbucket.org/brejoc/$(NAME)/raw/$(REVISION)/upgrade_mailer.py
	wget -P ./src https://bitbucket.org/brejoc/$(NAME)/raw/$(REVISION)/upgrade_mailer_py.ini
	cp ./src/upgrade_mailer.py ./build/usr/local/bin/
	cp ./src/upgrade_mailer_py.ini ./build/etc/
	cp -r ./cfg/cron.daily ./build/etc/
	chmod +x ./build/usr/local/bin/upgrade_mailer.py
	chmod +x ./build/etc/cron.daily/upgrade_mailer


package_deb: prepare
	fpm -s dir \
	    -t deb \
	    -n $(PKG_NAME) \
	    -v $(VERSION) \
	    -a all \
	    --license GPLv3 \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --url "http://webgarbage.de/" \
	    --deb-user root \
	    --deb-group root \
	    --config-files /etc/upgrade_mailer_py.ini \
	    --config-files /etc/cron.daily/upgrade_mailer \
	    --after-install ./scripts/post-install \
	    -d python-apt \
	    -d python-xmpp \
	    -C ./build \
	    usr etc

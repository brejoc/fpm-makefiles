NAME=pelicanbay-apt-repository
VERSION=0.1

.PHONY: all clean package_deb prepare

all: clean package_deb

clean:
	rm -f *.deb
	rm -rf ./build

prepare: clean
	mkdir -p ./build/etc/apt/sources.list.d/
	cp ./configs/pelicanbay.list ./build/etc/apt/sources.list.d/.
	chmod 644 ./build/etc/apt/sources.list.d/pelicanbay.list

package_deb: prepare
	echo "foooo"
	fpm -s dir \
            -t deb \
            -n $(NAME) \
            -v $(VERSION) \
            -a all \
            --license GPLv3 \
            -m "Jochen Breuer <breuer@dajool.com>" \
            --url "http://dajool.com" \
            --deb-user root \
            --deb-group root \
            --config-files /etc/apt/sources.list.d/pelicanbay.list \
	    --after-install ./scripts/post_install \
	    --before-remove ./scripts/post_uninstall \
            -d curl \
	    -d add-apt-key \
	    -d bash \
            -C ./build etc


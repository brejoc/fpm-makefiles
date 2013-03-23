NAME=schematics
VERSION=XXX

.PHONY: all clean package_deb package_rpm prepare

all: clean package_deb clean package_rpm

clean:
	rm -f python-$(NAME)*.deb
	rm -f python-$(NAME)*.rpm

prepare:
	# nothing to prepare

package_deb: prepare
	fpm -s python -t deb $(NAME) 

package_rpm: prepare
	fpm -s python -t rpm $(NAME) 

NAME=todo.txt
VERSION=2.9

.PHONY: all clean package

all: clean package

clean:
	rm -f ./todo.txt_cli-$(VERSION).tar.gz
	rm -rf ./todo.txt_cli-$(VERSION)
	rm -f ./todo
	rm -f *.deb

package:
	wget https://github.com/downloads/ginatrapani/todo.txt-cli/todo.txt_cli-$(VERSION).tar.gz
	tar xf todo.txt_cli-$(VERSION).tar.gz
	mv todo.txt_cli-$(VERSION)/todo.sh todo
	chmod +x todo
	fpm -s dir -t deb -n $(NAME) -v $(VERSION) -a all --license GPLv3 -m "Jochen Breuer <brejoc@gmail.com>" --url "http://todotxt.com/" --deb-user root --deb-group root -d sed -d grep --prefix /usr/local/bin todo

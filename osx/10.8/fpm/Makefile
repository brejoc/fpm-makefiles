SHELL := /bin/bash

.PHONY: all clean prepare package_osx
.SILENT: help 

all: clean package_osx

package_osx:
	pushd arr-pm; make package_osx; popd;
	pushd backports; make package_osx; popd;
	pushd cabin; make package_osx; popd;
	pushd clamp; make package_osx; popd;
	pushd fpm; make package_osx; popd;
	pushd json; make package_osx; popd;
	pushd open4; make package_osx; popd;

clean:
	pushd arr-pm; make clean; popd;
	pushd backports; make clean; popd;
	pushd cabin; make clean; popd;
	pushd clamp; make clean; popd;
	pushd fpm; make clean; popd;
	pushd json; make clean; popd;
	pushd open4; make clean; popd;

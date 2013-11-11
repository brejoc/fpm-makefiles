SHELL := /bin/bash

.PHONY: all clean prepare package_deb package_rpm
.SILENT: help 

all: clean package_deb package_rpm

help:
	echo "***********************************************************"
	echo "* just type make to make all deb and rpm packages for fpm *"
	echo "* or make package_deb and package_rpm for deb or rpm      *"
	echo "* packages.                                               *"
	echo "***********************************************************"

package_deb:
	pushd addressable; make package_deb; popd;
	pushd arr-pm; make package_deb; popd;
	pushd backports; make package_deb; popd;
	pushd cabin; make package_deb; popd;
	pushd childprocess; make package_deb; popd;
	pushd clamp; make package_deb; popd;
	pushd ffi; make package_deb; popd;
	pushd fpm; make package_deb; popd;
	pushd ftw; make package_deb; popd;
	pushd http_parser.rb; make package_deb; popd;
	pushd json; make package_deb; popd;

clean:
	pushd addressable; make clean; popd;
	pushd arr-pm; make clean; popd;
	pushd backports; make clean; popd;
	pushd cabin; make clean; popd;
	pushd childprocess; make clean; popd;
	pushd clamp; make clean; popd;
	pushd ffi; make clean; popd;
	pushd fpm; make clean; popd;
	pushd ftw; make clean; popd;
	pushd http_parser.rb; make clean; popd;
	pushd json; make clean; popd;

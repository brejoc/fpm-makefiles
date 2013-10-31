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
	pushd arr-pm; make package_deb; popd;
	pushd backports; make package_deb; popd;
	pushd cabin; make package_deb; popd;
	pushd clamp; make package_deb; popd;
	pushd fpm; make package_deb; popd;
	pushd json; make package_deb; popd;
	pushd open4; make package_deb; popd;

package_rpm:
	pushd arr-pm; make package_rpm; popd;
	pushd backports; make package_rpm; popd;
	pushd cabin; make package_rpm; popd;
	pushd clamp; make package_rpm; popd;
	pushd fpm; make package_rpm; popd;
	pushd json; make package_rpm; popd;
	pushd open4; make package_rpm; popd;

clean:
	pushd arr-pm; make clean; popd;
	pushd backports; make clean; popd;
	pushd cabin; make clean; popd;
	pushd clamp; make clean; popd;
	pushd fpm; make clean; popd;
	pushd json; make clean; popd;
	pushd open4; make clean; popd;

#!/bin/bash
yum -y install rpm-build
mkdir -p ~/rpmbuild/SOURCES && \
	rm -rf ~/rpmbuild/SOURCES/termrec-latest.tar.gz termrec-latest && \
	git clone https://github.com/kilobyte/termrec termrec-latest && \
	tar -czf ~/rpmbuild/SOURCES/termrec-latest.tar.gz termrec-latest && \
	rpmbuild -bb termrec.spec

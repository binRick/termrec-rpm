#!/bin/bash
rm -rf termrec termrec-latest
mkdir -p ~/rpmbuild/SOURCES
rm -rf ~/rpmbuild/SOURCES/termrec-latest.tar.gz termrec-latest
set -e
git clone https://github.com/kilobyte/termrec termrec-latest
tar -czf ~/rpmbuild/SOURCES/termrec-latest.tar.gz termrec-latest && \
rpmbuild -bb termrec.spec
set +e

rm -rf termrec termrec-latest

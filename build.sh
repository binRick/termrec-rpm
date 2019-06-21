#!/bin/bash
DIR_BASE=$(cd ${BASH_SOURCE[0]%/*} && pwd)
RELEASE_VERSION=$1
SPEC_FILE=termrec.spec
if [ "$RELEASE_VERSION" == "" ]; then
  echo "First argument must be release version to compile"; exit 1
fi

set -e

if [ -f ".${SPEC_FILE}" ]; then
  unlink .${SPEC_FILE}
fi

cp ${SPEC_FILE}.template .${SPEC_FILE}
sed -i "s/__RELEASE_VERSION__/${RELEASE_VERSION}/g" .${SPEC_FILE}

rm -rf termrec termrec-${RELEASE_VERSION}
mkdir -p ~/rpmbuild/SOURCES
rm -rf ~/rpmbuild/SOURCES/termrec-${RELEASE_VERSION} termrec-${RELEASE_VERSION}
set -e

wget https://github.com/kilobyte/termrec/archive/v${RELEASE_VERSION}.tar.gz -O termrec-${RELEASE_VERSION}.tar.gz
mv termrec-${RELEASE_VERSION}.tar.gz ~/rpmbuild/SOURCES/

rpmbuild -bb .${SPEC_FILE}
set +e

rm -rf termrec termrec-${RELEASE_VERSION}

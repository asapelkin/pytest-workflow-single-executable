#!/bin/bash
set -ex

: ${BUILD_DIR:?"BUILD_DIR is not set or is empty"}
: ${DIST_DIR:?"DIST_DIR is not set or is empty"}

mkdir -p $BUILD_DIR
mkdir -p $DIST_DIR

python -m nuitka \
--standalone \
$(which pytest_plus_nuitka) \
-o pytest_plus_nuitka.nuitka \
--output-dir=${BUILD_DIR} \
--jobs=$(nproc --all) \
--include-package=_pytest \
--include-package-data=_pytest \
--include-package=pytest_workflow \
--include-package-data=pytest_workflow \
--onefile

mv ${BUILD_DIR}/pytest_plus_nuitka.nuitka ${DIST_DIR}/pytest_plus_nuitka.nuitka
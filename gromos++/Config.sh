#!/bin/bash

echo "preparing local settings"

OK=0

mkdir -p config

aclocal --force || OK=1 &&
if [[ $OK == 1 ]]; then
  echo WARNING: aclocal did not run properly...
  OK=0
fi
glibtoolize  --copy --force || OK=1 &&
if [[ $OK == 1 ]]; then
  echo WARNING: libtoolize did not run properly...
  OK=0
fi
autoconf --force || OK=1 &&
if [[ $OK == 1 ]]; then
  echo WARNING: autoconf did not run properly...
  OK=0
fi
autoheader --force || OK=1 &&
if [[ $OK == 1 ]]; then
  echo WARNING: autoheader did not run properly...
  OK=0
fi
automake --add-missing --copy --force || OK=1 
if [[ $OK == 1 ]]; then
  echo WARNING: automake did not run properly...
  OK=0
fi
svn revert INSTALL >& /dev/null
if [[ $OK == 1 ]]; then
  echo WARNING: svn did not run properly...
  OK=0
fi

echo ""
echo "run configure next"
echo "for a list of options run configure --help"
echo ""

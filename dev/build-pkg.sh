#/bin/bash

make -C ..
cp ../_build/src/coral.native Coral/payload/coral
munki-pkg/munkipkg Coral
cp Coral/build/* build/

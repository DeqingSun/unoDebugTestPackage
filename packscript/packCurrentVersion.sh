#!/bin/bash

#prepared for mac

COREVERSION=0.0.5
TOOLSVERSION=2022.11.04
COREFILE=avr8debug-core-$COREVERSION.tar.bz2

#pack core

#Stop OS X tar from including hidden ._ files in archives
export COPYFILE_DISABLE=1;

tar -jcv --exclude="*DS_Store" -f packedFiles/$COREFILE -C ../ avr8debug

./gen_platform_entry.sh packedFiles/$COREFILE $COREVERSION $TOOLSVERSION > packedFiles/platform_$COREVERSION.txt

#pack tools
TOOLFILE_MAC=avr8debug-tools_macosx-$TOOLSVERSION.tar.bz2
tar -jcv --exclude="*DS_Store" -f packedFiles/$TOOLFILE_MAC -C ../ tools/macosx

TOOLFILE_WIN=avr8debug-tools_mingw32-$TOOLSVERSION.tar.bz2
tar -jcv --exclude="*DS_Store" -f packedFiles/$TOOLFILE_WIN -C ../ tools/win


./gen_tools_entry.sh packedFiles/avr8debug-tools $TOOLSVERSION $COREVERSION > packedFiles/tools_$TOOLSVERSION.txt


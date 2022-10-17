#!/bin/bash

# helper script for automatic releases.
#
# Prints one platform entry for the given file to be added to the
# package_*.json file.


if [ $# -ne 3 ]; then
	echo
	echo "helper script for automatic releases."
	echo
	echo "Prints one platform entry for the given file to be added to the"
	echo "package_*_index.json file."
	echo
	echo "usage: $0 corefile coreversion sdccversion toolsversion"
	exit 1
fi

COREFILE=$1
COREVERSION=$2
TOOLSVERSION=$3
PACKAGER=Arduino_Uno_Debug_Package

BASEURL=https://github.com/DeqingSun/unoDebugTestPackage/releases/download/${COREVERSION}

### helper functions #####################################################

# format ID information for a file
print_filedata()
{
	FILENAME=$(basename "$1")
	URL=${BASEURL}/${FILENAME}
	SIZE=$(stat -f%z $1)
	CHKSUM=$(shasum -a 256 $1|cut "-d " -f1)
cat << EOF
    "url": "$URL",
    "archiveFileName": "$FILENAME",
    "checksum": "SHA-256:$CHKSUM",
    "size": "$SIZE"
EOF
}



# list of supported boards in current boards.txt
list_boards()
{
	echo -n "    \"boards\": ["
	n=0
	sed -n "s/.*\.name=//p" ../avr8debug/boards.txt |\
	while read line; do
		if [ $n -ne 0 ]; then echo -n ","; fi
		echo
		echo -n "        {\"name\": \"$line\"}"
		n=$((n+1))
	done
	echo
	echo "    ],"
}



### print a platform entry for the given file ############################

cat << EOF
{
    "name": "Arduino 8-bit with Debug",
    "architecture": "avr",
    "version": "$COREVERSION",
    "category": "Contributed",
EOF
list_boards
cat << EOF
    "toolsDependencies": [
        {
            "name": "DWDebugTools",
            "version": "$TOOLSVERSION",
            "packager": "$PACKAGER"
        }
    ],
EOF
print_filedata "$COREFILE"
echo "},"

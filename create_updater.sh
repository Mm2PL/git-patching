#!/bin/bash
if (( $# != 2 ))
then
    echo This is an updater generator,
    echo "Usage: $(basename $0) (PATCH NAME) (PATCH URL)"
    exit 1
fi

name=$1
url=$2

cat > $1_updater.sh << EOF
if command -v curl
then
    curl -L $url > custom_patches/$name
elif command -v wget
then
    wget -O - $url > custom_patches/$name
fi
EOF


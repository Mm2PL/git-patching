#!/bin/bash
if (( $# != 3 ))
then
    echo This is an updater generator,
    echo "Usage: $(basename $0) (PATCH NAME) (PATCH URL) [UPDATER URL]"
    echo "Note: UPDATER URL doesn't need to exist right now."
    exit 1
fi

if (( $# == 2 ))
then
    name=$1
    url=$2
    
    cat > $1_updater.sh << EOF
#!/bin/bash
if command -v curl
then
    curl -L $url > custom_patches/$name
elif command -v wget
then
    wget -O - $url > custom_patches/$name
fi
EOF
else
    name=$1
    url=$2
    updater_url=$3
    
    cat > $1_updater.sh << EOF
#!/bin/bash
if command -v curl
then
    curl -L $url > custom_patches/$name
    curl -L $updater_url > custom_patches/${name}_updater.sh
elif command -v wget
then
    wget -O - $url > custom_patches/$name
    wget -O - $updater_url > custom_patches/${name}_updater.sh
fi
EOF
fi

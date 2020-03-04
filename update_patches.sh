#!/bin/bash
function ask_yes_or_no() {
    read -p "$1 ([y]es or [N]o): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *) echo "no" ;;
    esac
}

if [ "yes" == $(ask_yes_or_no "Do you want to run all update scripts? ") ]
then
    echo "Updating all the patches..."
else
    echo "Exiting :)"
    exit 1
fi
echo 

num=0
for i in $(find custom_patches -name "*.patch_updater.sh");
do
    ((num++))
    echo $num [  ] Running $i
    chmod +x $i  # make sure the user can run the script before attempting to start it.
    if eval $i
    then
        echo [OK]
    else
        echo [Fail] Failed to run $i
        exit 1
    fi
done

echo Updated $num patches.
exit 0

#!/bin/bash
function ask_yes_or_no() {
    read -p "$1 ([y]es or [N]o): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *) echo "no" ;;
    esac
}
if [ "yes" == $(ask_yes_or_no "Do you want to override your repo's state? [git reset --hard]") ]
then
    echo [  ] Resetting repo
    if git reset --hard
    then
        echo [OK] Resetting repo
    else
        echo [Fail] Resetting repo
    fi 
fi
echo 
num=0

for i in $(find custom_patches -name "*.patch");
do
    ((num++))
    echo $num [  ] Applying $i
    if git apply $i 
    then
        echo $num [OK]
    else
        echo $num [PROBLEM] Unable to apply $i
        exit 1
    fi
done
echo Applied $num patches.
exit 0

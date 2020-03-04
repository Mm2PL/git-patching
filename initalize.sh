#!/bin/bash
mkdir custom_patches -p
cat << EOF
Created custom patches directory, you can now put patches there.

You can use

-   $ ./apply_patches.sh
    to just apply the patches

-   $ ./create_updater.sh
    to create a generic updater script for a patch

-   $ ./move_to_master.sh
    to update your program, apply the patches and recompile.

-   $ ./recompile.sh
    to recompile your program, it will work for Qt and cmake projects
    you might want to modify this script

-   $ ./update_patches.sh
    to update your patches

-   $ git format-patch COMMIT
    to create a patch from a commit
EOF


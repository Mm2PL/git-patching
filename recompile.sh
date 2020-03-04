#!/bin/bash
cd build || mkdir build
qmake .. || cmake .. || exit 1
make -j4 && notify-send "Build done :)" $(date -Iseconds)

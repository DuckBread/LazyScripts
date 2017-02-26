#!/bin/bash

# BEGIN FUNCTIONS

# Function to get a timestamp
timestamp() {
  date +"%Y-%m-%d_%H-%M-%S"
}

# Function to decode a base64 value to text
decode () {
  echo "$1" | base64 -d ; echo
}


# END FUNCTIONS


# ____---ALL CODE SHOULD BE BELOW THIS LINE! ONLY FUNCTIONS ARE ABOVE HERE!---____
# Explanation: Bash will only recognize a function and be able to use
# it only if it's created/read/whatever before the line which calls
# the function is located at. So Bash needs "Functions > Code" and not "Code > Functions"


# BreadBuilds logo
decode X19fX19fICAgICAgICAgICAgICAgICAgICBfX19fX19fICAgICAgIF8gXyAgICAgXyAgICAgDQp8IF9fXyBcICAgICAgICAgICAgICAgICAgfCB8IF9fXyBcICAgICAoXykgfCAgIHwgfCAgICANCnwgfF8vIC9fIF9fIF9fXyAgX18gXyAgX198IHwgfF8vIC9fICAgXyBffCB8IF9ffCB8X19fIA0KfCBfX18gXCAnX18vIF8gXC8gX2AgfC8gX2AgfCBfX18gXCB8IHwgfCB8IHwvIF9gIC8gX198DQp8IHxfLyAvIHwgfCAgX18vIChffCB8IChffCB8IHxfLyAvIHxffCB8IHwgfCAoX3wgXF9fIFwNClxfX19fL3xffCAgXF9fX3xcX18sX3xcX18sX1xfX19fLyBcX18sX3xffF98XF9fLF98X19fLw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA=
echo ""
echo "=========="
echo "Begin building XOSP-N for Nexus 6 (shamu) **UNOFFICIAL**"
echo ""
echo "Building at $(timestamp)"
echo "=========="
echo ""


# We need to change into our working directory, as we'll be starting in the Jenkins main folder
# by default.
cd ~/android

# Sync the XOSP repo, and the CM repos (for device port)
echo ""
echo "=========="
echo "Beginning repo sync for XOSP-N with 4 threads"
echo "=========="
echo ""

repo sync -j4 --force-sync

echo ""
echo "=========="
echo "Finished repo sync for XOSP-N"
echo "=========="
echo ""

echo ""
echo "=========="
echo "Preparing CCACHE"
echo "=========="
echo ""
# Make sure CCache is enabled
export USE_CCACHE=1
# Make sure CCache is set to use 150GB of disk space
prebuilts/misc/linux-x86/ccache/ccache -M 150G

# Make sure we're still in the proper directory
cd ~/android

# Setup build environment
echo ""
echo "=========="
echo "Preparing build envrionment (build/envsetup.sh)"
echo "=========="
echo ""
source build/envsetup.sh

# Begin build
echo ""
echo "=========="
echo "Running 'brunch' and building for 'shamu' with 4 threads"
echo "=========="
echo ""
brunch shamu -j4

# This should be called last. It should signal that the build finished.
echo ""
# BreadBuilds logo
decode X19fX19fICAgICAgICAgICAgICAgICAgICBfX19fX19fICAgICAgIF8gXyAgICAgXyAgICAgDQp8IF9fXyBcICAgICAgICAgICAgICAgICAgfCB8IF9fXyBcICAgICAoXykgfCAgIHwgfCAgICANCnwgfF8vIC9fIF9fIF9fXyAgX18gXyAgX198IHwgfF8vIC9fICAgXyBffCB8IF9ffCB8X19fIA0KfCBfX18gXCAnX18vIF8gXC8gX2AgfC8gX2AgfCBfX18gXCB8IHwgfCB8IHwvIF9gIC8gX198DQp8IHxfLyAvIHwgfCAgX18vIChffCB8IChffCB8IHxfLyAvIHxffCB8IHwgfCAoX3wgXF9fIFwNClxfX19fL3xffCAgXF9fX3xcX18sX3xcX18sX1xfX19fLyBcX18sX3xffF98XF9fLF98X19fLw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA=
echo ""
echo "Build exited at $(timestamp)"
echo ""
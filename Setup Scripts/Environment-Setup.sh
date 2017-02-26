#!/bin/bash



# BEGIN CODE


# Ask for sudo
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

# Ask user if they want to ensure Java is purged from their system

echo "Uninstall all Java installations if any are available?"
echo "It's STRONGLY RECOMMENDED you do this!"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo ""; echo "Wiping Java..."; sudo apt-get remove openjdk-* icedtea-* icedtea6-* -y > /dev/null 2>&1; break;;
        No ) echo "Skipping Java wipe. THERE MAY BE ISSUES!"; break;;
    esac
done

echo ""
echo "Installing main build tools..."
sudo apt-get install git ccache automake lzop bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 g++-multilib python-networkx libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng maven imagemagick -y > /dev/null 2>&1
echo ""
echo "Installing 'repo' command..."
# INSTALL REPO COMMAND
mkdir ~/bin > /dev/null 2>&1
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo > /dev/null 2>&1
chmod a+x ~/bin/repo > /dev/null 2>&1
echo "export PATH=~/bin:$PATH" >> ~/.bashrc > /dev/null 2>&1
echo "export USE_CCACHE=1" >> ~/.bashrc > /dev/null 2>&1
source ~/.bashrc
# END REPO COMMAND INSTALL
echo ""
echo "Add the OpenJDK PPA and install OpenJDK-8?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo ""; echo "Working..."; sudo add-apt-repository ppa:openjdk-r/ppa -y > /dev/null 2>&1 && sudo apt-get update > /dev/null 2>&1 && sudo apt-get install openjdk-8-jdk -y > /dev/null 2>&1; echo ""; echo "Setup finished!"; exit;;
        No ) echo ""; echo "Setup finished!"; exit;;
    esac
done


# END CODE

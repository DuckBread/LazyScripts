# LazyScripts
Scripts I use when I'm too lazy to run the commands myself

***I will not provide support for these unless otherwise stated below!***

## About the scripts
* **[Build Scripts/Build-XOSP_N-Shamu.sh](https://github.com/DuckBread/LazyScripts/blob/master/Build%20Scripts/Build-XOSP_N-Shamu.sh) -** This is designed to be executed by Jenkins running on my home server. This way I can do (mostly) automated builds of XOSP. It *can* be used outside of Jenkins however, so if you just want to run it straight from your terminal, you may.
* **[Setup Scripts/Environment-Setup.sh](https://github.com/DuckBread/LazyScripts/blob/master/Setup%20Scripts/Environment-Setup.sh) -** This script will install common dependencies required for building Android ***7.x.x*** on ***Ubuntu 16.04.x***. This is a generic install, and certain ROMs and/or Android versions may need different packages (especially Java versions). Should this be the case, just correct the issues yourself after the install.

  ***Side note:*** *Certain Ubuntu distros don't include the same packages as normal Ubuntu. For example, ImageMagick isn't included with Ubuntu GNOME, but it is with standard Ubuntu. I've added ImageMagick to here as I use Ubuntu GNOME. If you find this to be the case with another Ubuntu 16.04.x distro and wish to fix it, please create a pull request!*

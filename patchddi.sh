#!/bin/bash
# run as root
set -e
rm DeveloperDiskImageModified.dmg || true
hdiutil convert -format UDRW -o DeveloperDiskImageModified.dmg /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/16.1/DeveloperDiskImage.dmg
hdiutil attach -owners on DeveloperDiskImageModified.dmg
#sed -e "s@/var/jb/bin/sh@/Developer/usr/bin/sh@g" ./procursus/var/jb/Library/LaunchDaemons/com.openssh.sshd.plist >/Volumes/DeveloperDiskImage/Library/LaunchDaemons/com.openssh.sshd.plist
cp com.worthdoingbadly.WDBDDISSH.plist /Volumes/DeveloperDiskImage/Library/LaunchDaemons/
chown root:wheel /Volumes/DeveloperDiskImage/Library/LaunchDaemons/com.worthdoingbadly.WDBDDISSH.plist
chmod 644 /Volumes/DeveloperDiskImage/Library/LaunchDaemons/com.worthdoingbadly.WDBDDISSH.plist
ln -s / /Volumes/DeveloperDiskImage/rootfs
hdiutil detach /Volumes/DeveloperDiskImage
bash signddi.sh

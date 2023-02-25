#!/bin/bash
# run as root
set -e
rm DeveloperDiskImageModified.dmg || true
hdiutil convert -format UDRW -o DeveloperDiskImageModified.dmg /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/16.1/DeveloperDiskImage.dmg
hdiutil attach -owners on DeveloperDiskImageModified.dmg
cp ./procursus/var/jb/Library/LaunchDaemons/com.openssh.sshd.plist /Volumes/DeveloperDiskImage/Library/LaunchDaemons/com.openssh.sshd.plist
chown root:wheel /Volumes/DeveloperDiskImage/Library/LaunchDaemons/com.openssh.sshd.plist
chmod 644 /Volumes/DeveloperDiskImage/Library/LaunchDaemons/com.openssh.sshd.plist
hdiutil detach /Volumes/DeveloperDiskImage

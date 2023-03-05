#!/bin/bash
# run as root
set -e
hdiutil convert -format UDRW -o DeveloperDiskImageModified_16.1.dmg /Applications/Xcode_14.2.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/16.1/DeveloperDiskImage.dmg
hdiutil convert -format UDRW -o DeveloperDiskImageModified_16.0.dmg /Applications/Xcode_14.2.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/16.0/DeveloperDiskImage.dmg
hdiutil attach -owners on DeveloperDiskImageModified_16.1.dmg
for i in com.apple.debugserver.plist
do
	cp $i /Volumes/DeveloperDiskImage/Library/LaunchDaemons/
	chown root:wheel /Volumes/DeveloperDiskImage/Library/LaunchDaemons/$i
	chmod 644 /Volumes/DeveloperDiskImage/Library/LaunchDaemons/$i
done
for i in com.apple.ps.plist
do
        ln -s ../../../bin/ps /Volumes/DeveloperDiskImage/usr/bin/
	cp $i /Volumes/DeveloperDiskImage/Library/LaunchDaemons/
        chown root:wheel /Volumes/DeveloperDiskImage/Library/LaunchDaemons/$i
        chmod 644 /Volumes/DeveloperDiskImage/Library/LaunchDaemons/$i
done
hdiutil detach /Volumes/DeveloperDiskImage
hdiutil attach -owners on DeveloperDiskImageModified_16.0.dmg
for i in com.apple.debugserver.plist
do
        cp $i /Volumes/DeveloperDiskImage/Library/LaunchDaemons/
        chown root:wheel /Volumes/DeveloperDiskImage/Library/LaunchDaemons/$i
        chmod 644 /Volumes/DeveloperDiskImage/Library/LaunchDaemons/$i
done
for i in com.apple.ps.plist
do
        ln -s ../../../bin/ps /Volumes/DeveloperDiskImage/usr/bin/
        cp $i /Volumes/DeveloperDiskImage/Library/LaunchDaemons/
        chown root:wheel /Volumes/DeveloperDiskImage/Library/LaunchDaemons/$i
        chmod 644 /Volumes/DeveloperDiskImage/Library/LaunchDaemons/$i
done
hdiutil detach /Volumes/DeveloperDiskImage
bash signddi.sh

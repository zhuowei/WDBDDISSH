#!/bin/bash
# run as root
set -e
rm DeveloperDiskImageModified.dmg || true
hdiutil convert -format UDRW -o DeveloperDiskImageModified.dmg /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/16.1/DeveloperDiskImage.dmg
hdiutil attach -owners on DeveloperDiskImageModified.dmg
for i in com.apple.debugserver.plist
do
	cp $i /Volumes/DeveloperDiskImage/Library/LaunchDaemons/
	chown root:wheel /Volumes/DeveloperDiskImage/Library/LaunchDaemons/$i
	chmod 644 /Volumes/DeveloperDiskImage/Library/LaunchDaemons/$i
done
hdiutil detach /Volumes/DeveloperDiskImage
bash signddi.sh

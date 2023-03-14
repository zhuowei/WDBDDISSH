#!/bin/sh
openssl dgst -sign key.pem -out DeveloperDiskImageModified_16.1.dmg.signature -binary -sha1 DeveloperDiskImageModified_16.1.dmg
openssl dgst -sign key.pem -out DeveloperDiskImageModified_16.0.dmg.signature -binary -sha1 DeveloperDiskImageModified_16.0.dmg
openssl dgst -sign key.pem -out DeveloperDiskImageModified_16.0.dmg.signature -binary -sha1 DeveloperDiskImageModified_15.7.dmg
openssl dgst -sign key.pem -out DeveloperDiskImageModified_16.0.dmg.signature -binary -sha1 DeveloperDiskImageModified_15.6.dmg
openssl dgst -sign key.pem -out DeveloperDiskImageModified_16.0.dmg.signature -binary -sha1 DeveloperDiskImageModified_15.5.dmg

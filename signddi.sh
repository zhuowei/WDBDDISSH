#!/bin/sh
openssl dgst -sign key.pem -out DeveloperDiskImageModified.dmg.signature -binary -sha1 DeveloperDiskImageModified.dmg

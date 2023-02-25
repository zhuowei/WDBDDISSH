#!/bin/sh
openssl dgst -sign key.pem -out DeveloperDiskImageModified.dmg.signature -binary DeveloperDiskImageModified.dmg

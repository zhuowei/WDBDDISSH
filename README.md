# Doesn't work yet, please ignore

Doesn't work: the image mounts, the launchd job loads, but nothing happens.

- `./gencert.sh`, or just use the existing certs
- `sudo ./patchddi.sh`
- Open `cert.pem` on your device
- Settings -> General -> VPN & Device Management -> Worth Doing Badly DDI -> Install

  ** WARNING **: if you're using the cert.pem from this repo, trusting it may let others READ YOUR NETWORK TRAFFIC; remove this cert IMMEDIATELY after mounting, or (better) generate your own cert.pem

- unplug phone (to prevent Xcode from mounting a Developer Disk Image)
- reboot device
- use any MacDirtyCow file switcher to switch `/System/Library/Lockdown/iPhoneDebug.pem` with cert.pem
- plug in phone
- `ideviceimagemounter DeveloperDiskImageModified.dmg DeveloperDiskImageModified.dmg.signature`

Thanks to [@alkalinesec](https://twitter.com/alkalinesec/status/1624768369449631746) for the approach.

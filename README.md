# Doesn't work yet, please ignore

Doesn't work: the image mounts and loads the launchd jobs, but the launchd jobs can only refer to binaries on the DeveloperDiskImage.

I tried adding my own (developer signed) binaries and it didn't work; not sure if I need to do something specific...

- `./gencert.sh`, or just use the existing certs
- `sudo ./patchddi.sh`
- Open `cert.pem` on your device
- Settings -> General -> VPN & Device Management -> Worth Doing Badly DDI -> Install

  ** WARNING **: adding a certificate SEVERELY reduces your device's security. (The certificate has an expiry date of 2014 to match Apple's, so I don't think this can be used to sniff network traffic, but I'm not completely sure.) Remove this cert IMMEDIATELY after mounting, or (better) generate your own cert.pem

- unplug phone (to prevent Xcode from mounting a Developer Disk Image)
- reboot device
- use any MacDirtyCow file switcher to switch `/System/Library/Lockdown/iPhoneDebug.pem` with cert.pem
- plug in phone
- `ideviceimagemounter DeveloperDiskImageModified.dmg DeveloperDiskImageModified.dmg.signature`
- I couldn't figure out what to do with this, so I just made another debugserver LaunchDaemon that launches on port 24601
- `iproxy 24601 24601`
- lldb can attach to processes:
  - `process connect connect://localhost:24601`
  - `attach <pid>`
  - it'll take about a minute to pull the libraries from dyld cache, then it attaches
- but lldb can't spawn processes:
  - `target create /bin/ps`
  - `process connect connect://localhost:24601`
  - `run`
  - You'll get a sandbox denial in Console.app from debugserver trying to start /bin/ps:
    > 1 +0.000000 sec [0198/0103]: error: ::posix_spawnp ( pid => 0, path = '/bin/ps', file_actions = , attr = , argv = , envp =  ) err = Operation not permitted (0x00000001)

Thanks to [@alkalinesec](https://twitter.com/alkalinesec/status/1624768369449631746) for the approach.

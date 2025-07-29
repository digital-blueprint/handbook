# Remote Android Debugging

## For Firefox 68 (Android)

Setup:

* Android: Enable developer mode
* Android: Enabled USB debugging
* `sudo apt install adb`
* `sudo adb kill-server`
* `sudo adb start-server` -> confirm on phone
* Install firefox 68esr (anything newer requires FF Preview on Android)
* Start with `./firefox -p`, create a new profile ("esr" for example), disable check to auto use the new profile
* Disable auto updates in the preferences
* `about:config` -> `devtools.debugger.remote-enabled` and `devtools.aboutdebugging.new-enabled`
* Restart firefox
* Open firefox on Android
* Settings -> Advanced -> Remote Debugging via USB

Debugging:

* Open the page you want to debug
* `about:debugging` -> you should see a device and connect
* Confirm on phone
* ...
* profit
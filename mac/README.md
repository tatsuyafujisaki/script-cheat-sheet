# How to reset Universal Clipboard and get it working again
1. Run the following command in Terminal.
   ```shell
   rm ~/Library/Preferences/com.apple.coreservices.useractivityd.plist
   ```
2. Restart Mac.

# How to reset Launchpad
```shell
defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock
```

# How to reset the Universal Clipboard and get it working again
1. Run the following command.
   ```shell
   rm ~/Library/Preferences/com.apple.coreservices.useractivityd.plist
   ```
2. Restart the macOS.

# How to reset Launchpad
```shell
defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock
```

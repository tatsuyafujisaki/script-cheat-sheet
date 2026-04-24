## `xcodebuild`

### How to display targets, build configurations, and schemes
```shell
xcodebuild -list
```
Note that the command "xcodebuild -list -workspace *.xcworkspace" doesn't display targets or "build configurations". It shows an excessive number of third-party schemes.

### How to display the scheme's destinations
```shell
xcodebuild -showdestinations -workspace *.xcworkspace -scheme <scheme>
```

### How to analyze the scheme
```shell
xcodebuild analyze -workspace *.xcworkspace -scheme <scheme> -destination generic/platform=iOS
```

## `xcrun`
### How to display simulators
```shell
xcrun simctl list devices
```

### How to display physical devices and simulators
```shell
xcrun xctrace list devices
```


set totalPages to 3
set saveFolder to POSIX path of (path to desktop folder) & "KindleScreenshots/"
do shell script "mkdir -p " & quoted form of saveFolder
tell application "Amazon Kindle" to activate
delay 1 -- Wait a brief moment for the window to focus

set exactPythonPath to "/usr/local/bin/python3"

set windowID to do shell script quoted form of exactPythonPath & " -c '
from Quartz import CGWindowListCopyWindowInfo, kCGWindowListOptionOnScreenOnly
window_list = CGWindowListCopyWindowInfo(kCGWindowListOptionOnScreenOnly, 0)
for w in window_list:
    if w.get(\"kCGWindowOwnerName\") == \"Kindle\" and w.get(\"kCGWindowName\"):
        print(w.get(\"kCGWindowNumber\"))
        break
'"

if windowID is "" then
	display dialog "Could not find a visible Kindle window. Please make sure Kindle is open." buttons {"OK"} default button "OK"
	return
end if

tell application "System Events"
	repeat with i from 1 to totalPages
		set fileName to saveFolder & "page_" & i & ".png"

		-- Capture just that specific window ID (-o removes the window drop shadow for a clean cut)
		do shell script "screencapture -l " & windowID & " -o " & quoted form of fileName

		-- Press the Right Arrow key to turn the page
		key code 124

		-- Wait 1.5 seconds for the next page to load
		delay 1.5
	end repeat
end tell

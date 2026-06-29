-- Before executing AppleScript, make sure the Kindle app is running in full screen.

set totalPages to 3
set waitTime to 1.0 -- Adjust this value if screenshots are skipped or duplicated due to slow rendering
set screenshotFolder to POSIX path of (path to desktop folder) & "screenshots/"
do shell script "mkdir -p " & quoted form of screenshotFolder

tell application "Amazon Kindle" to activate
delay waitTime -- Wait for the window to gain focus

tell application "System Events"
	repeat with i from 1 to totalPages
		-- Zero-pad the number to 3 digits (e.g., 001, 002... 010...)
		set paddedNum to text -3 thru -1 of ("00" & i)
		set fileName to screenshotFolder & paddedNum & ".png"

		-- Capture a screenshot of the entire screen
		do shell script "screencapture -D 2 " & quoted form of fileName

		-- Press the Right Arrow key to turn the page
		key code 124

		-- Wait for the next page to load
		delay waitTime
	end repeat
end tell

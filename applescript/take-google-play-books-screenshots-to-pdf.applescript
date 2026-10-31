-- Takes screenshots of every page of a Google Play Books book, stops automatically
-- at the last page, and combines the screenshots into one image-only PDF.
-- Run OCR on the resulting PDF with Adobe Acrobat afterwards.
--
-- Before executing AppleScript ...
-- 1. Install the tools: brew install img2pdf imagemagick
-- 2. Allow the app that runs this script (Script Editor, Terminal for osascript, etc.)
--    "Screen Recording" and "Accessibility" in System Settings > Privacy & Security.
-- 3. Open your book of Google Play Books in Google Chrome on the external display.
-- 4. Open Display options (https://support.google.com/googleplay/answer/9755756).
--    - switch off the "Vertical scroll" option to enable pagination.
--    - set zoom to "Fit to screen".
-- 5. Go to the first page and tap "Full screen".
-- 6. Run this script, click the book page within 10 seconds, then move the mouse
--    pointer to the other display and do not touch the Mac until it finishes.

set maxPages to 3000
set waitTime to 1.5 -- Adjust this value if screenshots are skipped or duplicated due to slow rendering
set displayNumber to 2 -- 1 = main display, 2 = second display
set stopAfter to 3 -- Stop when this many nearly identical screenshots appear in a row
set thresholdPercent to 1 -- Screenshots differing in this percentage of pixels or less count as identical
set manualStart to true -- true: click the page yourself (needed for the Play Books "Full screen" button)

set desktopPath to POSIX path of (path to desktop folder)
set screenshotFolder to desktopPath & "google-play-books-screenshots/"
set pdfPath to desktopPath & "google-play-books.pdf"
set shellPath to "export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH; "

-- Fail early if img2pdf or ImageMagick is not installed
do shell script shellPath & "command -v img2pdf && command -v magick"

do shell script "mkdir -p " & quoted form of screenshotFolder
set existingCount to (do shell script "ls " & quoted form of screenshotFolder & " | wc -l") as integer
if existingCount > 0 then
	display dialog "Empty " & screenshotFolder & " before running this script." buttons {"OK"} default button "OK"
	return
end if

if manualStart then
	display notification "Click the book page within 10 seconds." with title "Google Play Books"
	delay 10
else
	tell application "Google Chrome" to activate
	delay waitTime -- Wait for the window to gain focus
end if

set prevFile to ""
set sameRun to 0
repeat with i from 1 to maxPages
	-- Zero-pad the number to 4 digits (e.g., 0001, 0002... 0010...)
	set fileName to screenshotFolder & my padNumber(i) & ".png"

	-- Capture a screenshot of the entire display without the shutter sound
	do shell script "screencapture -x -D " & displayNumber & " " & quoted form of fileName

	if prevFile is not "" and my isSimilar(prevFile, fileName, thresholdPercent, shellPath) then
		set sameRun to sameRun + 1
	else
		set sameRun to 0
	end if

	if sameRun ≥ stopAfter then
		-- Delete the duplicates captured after the last page
		repeat with j from (i - sameRun + 1) to i
			do shell script "rm -f " & quoted form of (screenshotFolder & my padNumber(j) & ".png")
		end repeat
		exit repeat
	end if

	set prevFile to fileName

	-- Press the Right Arrow key to turn the page
	tell application "System Events" to key code 124

	-- Wait for the next page to load
	delay waitTime
end repeat

do shell script shellPath & "img2pdf " & quoted form of screenshotFolder & "*.png -o " & quoted form of pdfPath
display notification "Saved " & pdfPath with title "Google Play Books"

on padNumber(n)
	return text -4 thru -1 of ("000" & n)
end padNumber

-- Returns true when two screenshots are nearly identical.
-- The top 5% (menu bar with the clock) is ignored.
on isSimilar(fileA, fileB, thresholdPercent, shellPath)
	set cmd to shellPath & "t=$(mktemp -d); " & ¬
		"magick " & quoted form of fileA & " -gravity South -crop 100%x95%+0+0 +repage -resize 400x \"$t/a.png\"; " & ¬
		"magick " & quoted form of fileB & " -gravity South -crop 100%x95%+0+0 +repage -resize 400x \"$t/b.png\"; " & ¬
		"d=$(magick compare -metric AE -fuzz 10% \"$t/a.png\" \"$t/b.png\" null: 2>&1 | awk '{print int($1)}'); " & ¬
		"n=$(magick \"$t/a.png\" -format '%[fx:w*h]' info:); " & ¬
		"rm -f \"$t/a.png\" \"$t/b.png\"; rmdir \"$t\"; " & ¬
		"if [ \"$d\" -le $((n * " & thresholdPercent & " / 100)) ]; then echo yes; else echo no; fi"
	return (do shell script cmd) is "yes"
end isSimilar

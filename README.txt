Thank you for downloading!

CD to the directory containing, "drct.rb" and type, "ruby drct.rb" to use!

If you haven't downloaded Ruby already: https://www.ruby-lang.org/en/downloads/

To navigate to the command prompt:
-Press the windows key or start button and then type, "cmd.exe" and press enter
-Visit the /Applications/Utilities folder in iOS

To change directories: "cd C:\..."

"input.txt" MUST be formatted, line by line, with only two commands beginning each line:
-"Driver" which tells drct.rb to register a new driver
-"Trip" which tells drct.rb to log a new trip under a driver's name

Example:

Driver Michael
Trip Michael 11:00 11:01

If a Driver isn't first registered, they cannot log trips.

The, "Trip" command is more complex: requiring that the driver's name immediately follow, with start and end times in Hour:minute format using a 24 hour clock.

NOTE: drct.rb cannot process trips which take place over midnight.  All trips must start and end on the same day.

WARNING: every time, "drct.rb" is successfully executed, it will replace, "Report.txt" so be sure to either save its contents elsewhere or remove it before running, "drct.rb" again.

Have fun!
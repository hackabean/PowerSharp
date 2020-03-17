#####  PowerSharp
Moving powershell modules to enhanced PowerPick tool.

##### CREDIT:

Most of the heavy lifting has been done by creators of:

https://github.com/mgeeky/Stracciatella

I just added 2 + 2. 

#####  PURPOUSE:

Even though offensive security tradecraft has moved to C# and away from powershell many scripts and tools have not been fully translated into a new language.
This project serves as a temporary solution to that problem.

##### WHY ?

Many times on a simulated engagement I came across AV stopping execution of powershell scripts even if they were executed through powerpick.
This is my solution to the problem as well as introduces new improved version of powerpick that allows one to bypass script block logging and evade AV.

HOW TO ?

All assemblies have been built to allow for execution in common post-exploitation frameworks using execute-assembly.
Since the project uses mainly Straciatella runspace it also inherits its command switches.
-v - for verbose
-c - to run a function within a compressed script.

To make sure all long, formated powershell arguments are passed without any errors it is best to wrap your argument in double quotes.

DIY:

If you would like to build modules yourself here is a recepie:

1) Use forked version of Stracciatella:

https://github.com/hackabean/Stracciatella

2) Base64 encode your powershell script and place it in line 538

`command =  "IEX([Text.Encoding]::Utf8.GetString([Convert]::FromBase64String('BASE64HERE'))); " + command;`

3) Build solution with xbuild directly from linux or use VS17/19 from Windows.

4) Should the resulting assembly fall over the limit of 1MB, use compression. Personally I use:

https://github.com/TotalTechGeek/DotNetCompressor

Which can be run on Linux with mono for -gz compression.



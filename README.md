# Remove Live Content for imported presentations ([Mediasite Video Platform](http://www.sonicfoundry.com/mediasite/))

**What:**

Update Mediasite Presentation XML file with `IsLive` set to **false** and `LiveStatus` **0** to not show up Live Content at import.

* It does nothing to the original media

From here you proceed at import easily. See screenshots below.

_BEFORE_

![BEFORE the fix](BEFORE.png)

_AFTER_

![AFTER the fix](AFTER.png)

**Why:**

Windows Server 2012 drops support for streaming over `MMS://` and Windows Media Server.
Server 2012 had switched to SmoothStreaming built to IIS thus the Mediasite **Broadcast — Windows Media (wmv, wma)**
content server cannot be set up.

Sonic Foundry suggest downgrade to Windows Server 2008, but unless you are going to import
a Live Content presentations originating from previous Mediasite Server versions you are good.

But we were not.

## DOWNLOAD

[v0.1.0](https://github.com/paveljurca/import_fix/releases/tag/v0.1.0)

## SYNOPSIS

`import_fix.exe --live IMPORT_DIR IMPORT_DIR IMPORT_DIR [...]`

## USAGE

Wrap calls in a loop to surpass the [command-line string length limitation (8191 characters)](https://support.microsoft.com/en-us/help/830473/command-prompt-cmd--exe-command-line-string-limitation):

    for /d %f in ("YOUR_IMPORT_FOLDERS\*") do @import_fix.exe --live "%~ff" >>fixed.txt

## NOTES

* Does not support zipped packages (unzip them first)
* Windows Media Server
   * https://msdn.microsoft.com/en-us/library/cc239490.aspx
   * https://docs.microsoft.com/en-us/iis/media/windows-media-services/windows-media-server-or-web-server
* Smooth Streaming
   * https://docs.microsoft.com/en-us/iis/media/on-demand-smooth-streaming/getting-started-with-iis-smooth-streaming
* Built with [Perl2Exe](http://www.indigostar.com/perl2exe.php)

## CODE

* [Why is it such a bad idea to parse XML with regex](https://stackoverflow.com/questions/8577060/why-is-it-such-a-bad-idea-to-parse-xml-with-regex) and why is it not
* _IDE_ Microsoft Notepad

## LICENSE

Released into the public domain.

## DISCLAIMER

Don't blame me.

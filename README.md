# Remove Live Content for P2G packages

## Mediasite Video Platform

**Issue:**

Windows Server 2012 drops support for streaming over `MMS://` (and basically Windows Media Server; 2012 had switched to SmoothStreaming  built to IIS) thus following **Broadcast — Windows Media (wmv, wma)** content server cannot be made running. Sonic Foundry suggest downgrade to Windows Server 2008, but keep on reading..

..This is only a problem if you get to import a Live Content presentation originating from previous Mediasite Server versions.

**Solution:**

Update Mediasite Presentation XML file with `IsLive` set to **false** and `LiveStatus` **0**. (It does nothing to the original media.) From there you proceed at import easily.

**BEFORE**

![BEFORE the fix](BEFORE.png)

**AFTER**

![AFTER the fix](AFTER.png)

## DOWNLOAD

[v0.1.0](https://github.com/paveljurca/p2g_fix/releases/tag/v0.1.0)

## SYNOPSIS

`p2g_fix.exe --live *P2G *P2G *P2G [...]`

## USAGE

Wrap calls in a loop to surpass the [command-line string length of 8191 characters limitation](https://support.microsoft.com/en-us/help/830473/command-prompt-cmd--exe-command-line-string-limitation).

`for /f "usebackq tokens=*" %x in (`cmd /c "dir /a:d /b"`) do @p2g_fix.exe --live "%x" >>FIXED.txt`

## NOTES

* Does not support zipped packages (unzip them first)
* Windows Media Server

   * https://msdn.microsoft.com/en-us/library/cc239490.aspx
   * https://docs.microsoft.com/en-us/iis/media/windows-media-services/windows-media-server-or-web-server
   * https://docs.microsoft.com/en-us/iis/media/on-demand-smooth-streaming/getting-started-with-iis-smooth-streaming
* Built with [Perl2Exe](http://www.indigostar.com/perl2exe.php)
* _IDE_ Notepad

## CODE

* [Why is it such a bad idea to parse XML with regex?](https://stackoverflow.com/questions/8577060/why-is-it-such-a-bad-idea-to-parse-xml-with-regex)

  (It's rather appropriate as long as you parse a limited, known set of XML.)

## LICENSE

Released into the public domain.

## DISCLAIMER

Don't blame me.

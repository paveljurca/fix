# Remove Live Content for P2G packages

**Issue:**

Windows Server 2012 is not in a support of streaming over `MMS://` anymore, thus can't proceed at *such Mediasite import where Live Content goes with WMV* (usually originating from previous Mediasite Server versions) because following Mediasite content server cannot be made running though.

See https://msdn.microsoft.com/en-us/library/cc239490.aspx and https://docs.microsoft.com/en-us/iis/media/windows-media-services/windows-media-server-or-web-server.

**Solution:**

Update Mediasite Presentation XML file with `IsLive` set to **false** and `LiveStatus` **0**.

## DOWNLOAD

[v0.1.0](https://github.com/paveljurca/p2g_fix/releases/tag/v0.1.0)

## SYNOPSIS

`p2g_fix.exe --live *P2G *P2G *P2G [...]`

## NOTES

* Does not support zipped packages (unzip them first)
* Built with [Perl2Exe](http://www.indigostar.com/perl2exe.php)
* _IDE_ Notepad

## CODE

* [Why is it such a bad idea to parse XML with regex?](https://stackoverflow.com/questions/8577060/why-is-it-such-a-bad-idea-to-parse-xml-with-regex)

  (It's rather appropriate as long as you parse a limited, known set of XML.)

## LICENSE

Released into the public domain.

## DISCLAIMER

Don't blame me.

# Disable Live Content for P2G packages

**Issue:**

IIS 7.0 on Windows Server 2012 does not support WMV streaming (Microsoft Media Server); cannot setup following Mediasite content server.

**Why is it an issue?**

You can't proceed at importing such presentations (usually those from previous Mediasite Server versions).

**So?**

Update Mediasite Presentation XML file with `IsLive` set to **false** and `LiveStatus` **0**.

## DOWNLOAD

https://github.com/paveljurca/p2g_fix/releases/tag/v0.1.0

## SYNOPSIS

`p2g_fix.exe --live *P2G *P2G *P2G [...]`

## NOTES

* Does not support zipped packages (unzip them first)
* Built with [Perl2Exe](http://www.indigostar.com/perl2exe.php)
* _IDE_ Notepad

## DISCLAIMER

Don't blame me.

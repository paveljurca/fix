use strict;
use warnings 'all';

use File::Glob 'bsd_glob';

# ===== MAIN =====
# --- OPTIONS ---
err(qq(bad option, use '--live'))
  unless shift eq '--live';
# --- RUN ---
p2g_fix(@ARGV);
# ================

sub p2g_fix {

# PERLDOC
# Win32 users should use the real slash.
# If you really want to use backslashes,
# consider using Sarathy's File::DosGlob

while (defined(my $p2g = shift)) {
err(qq("$p2g" not a directory)) unless -d $p2g;

my ($xml) = grep(
/MediasitePresentation_\d{2}\.xml$/i,
bsd_glob(qq($p2g/*), File::Glob::GLOB_ERR | File::Glob::GLOB_NOSORT)
);
err(qq(Error reading "$p2g")) if File::Glob::GLOB_ERROR;

local @ARGV = $xml || err(qq("$p2g" please specify P2G directory));

# live_content_fix
my $fix = 0;
msg($p2g, 'found backup file, not proceeding'),next
  if -e $xml.'.bak';

# in-place edit with a backup file
local $^I = '.bak';
while (<>) {
s/$1/false/,$fix++ if /<IsLive>(true)</i;
s/$1/0/,$fix++ if /<LiveStatus>(1)</i;
print;
}

msg($p2g, $fix == 2 ? "Live Content fixed" : "OK");
}
}

sub msg {print shift, ' >> ', shift, "\n"}
sub err {die '(ERR) ' . shift . "\n"}
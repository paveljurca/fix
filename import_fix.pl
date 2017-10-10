use strict;
use warnings 'all';

use File::Glob 'bsd_glob';

# ===== MAIN =====
# --- OPTIONS ---
err(qq(bad option, use '--live'))
  unless shift eq '--live';
# --- RUN ---
import_fix(@ARGV);
# ================

sub import_fix {
  while (defined(my $import = shift)) {
    err(qq("$import" not a directory)) unless -d $import;

    # PERLDOC
    # Win32 users should use the real slash.
    # If you really want to use backslashes,
    # consider using Sarathy's File::DosGlob
    my ($xml) = grep(
      /MediasitePresentation_\d{2}\.xml$/i,
      bsd_glob(qq($import/*), File::Glob::GLOB_ERR | File::Glob::GLOB_NOSORT)
    );
    err(qq(Error reading "$import")) if File::Glob::GLOB_ERROR;

    local @ARGV = $xml || err(qq("$import" please specify IMPORT directory));

    my $live = 0;
    msg($import, 'found backup file, not proceeding'),next
      if -e $xml.'.bak';

    # in-place edit with a backup file
    local $^I = '.bak';
    while (<>) {
      s/$1/false/,$live++ if /<IsLive>(true)</i;
      s/$1/0/,$live++ if /<LiveStatus>(1)</i;
      print;
    }

    msg($import, $live == 2 ? "Live Content fixed" : "OK");
  }
}

sub msg {print shift, ' .. ', shift, "\n"}
sub err {die '(ERR) ' . shift . "\n"}

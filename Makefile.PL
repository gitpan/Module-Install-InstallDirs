# -*- perl -*-

use inc::Module::Install;

name		('Module-Install-InstallDirs');
abstract	('Module::Install extension to detect INSTALLDIR settings');
author		('Graham Barr <gbarr@pobox.com>');
version_from	('lib/Module/Install/InstallDirs.pm');
license		('perl');

check_nmake();      # check and download nmake.exe for Win32

&Makefile->write;
&Meta->write;

## - - - - - - - -

sub MY::postamble {
  return <<'POSTAMBLE';

disttest : distdir_check_sig

distdir_check_sig : distdir
	cd $(DISTVNAME) && $(PERL) -MModule::Signature=verify -e 'exit verify()'

POSTAMBLE

}

# This Makefile is for the PDT::Server extension to perl.
#
# It was generated automatically by MakeMaker version
# 6.50 (Revision: 65000) from the contents of
# Makefile.PL. Don't edit this file, edit Makefile.PL instead.
#
#       ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker ARGV: ()
#
#   MakeMaker Parameters:

#     ABSTRACT => q[Catalyst based application]
#     AUTHOR => q[Catalyst developer]
#     DIR => []
#     DISTNAME => q[PDT-Server]
#     EXE_FILES => [q[script/pdt_server_cgi.pl], q[script/pdt_server_create.pl], q[script/pdt_server_fastcgi.pl], q[script/pdt_server_server.pl], q[script/pdt_server_test.pl]]
#     NAME => q[PDT::Server]
#     NO_META => q[1]
#     PL_FILES => {  }
#     PREREQ_PM => { Fey::DBIManager=>q[0], Catalyst::Plugin::ConfigLoader=>q[0], Fey::ORM=>q[0], Fey::Loader=>q[0], Catalyst::View::Mason=>q[0], Catalyst::Plugin::Session::Store::FastMmap=>q[0], Catalyst::Plugin::Session::State::Cookie=>q[0], Digest::SHA=>q[0], MooseX::ClassAttribute=>q[0], Moose=>q[0], Module::Pluggable=>q[0], namespace::autoclean=>q[0], Test::Exception=>q[0], Catalyst::Plugin::Static::Simple=>q[0], ExtUtils::MakeMaker=>q[6.42], DBD::Pg=>q[0], Data::Dumper=>q[0], PDT::Config=>q[0], YAML::Syck=>q[0], Catalyst::Action::RenderView=>q[0], Catalyst::Plugin::Session=>q[0], Test::More=>q[0.94], MooseX::Types=>q[0], GD::SecurityImage=>q[0], Catalyst::Runtime=>q[5.80016] }
#     VERSION => q[0.001]
#     dist => { PREOP=>q[$(PERL) -I. "-MModule::Install::Admin" -e "dist_preop(q($(DISTVNAME)))"] }
#     realclean => { FILES=>q[MYMETA.yml] }
#     test => { TESTS=>q[t/00-testers/*.t t/01-backend/*.t t/02-frontend/*.t] }

# --- MakeMaker post_initialize section:


# --- MakeMaker const_config section:

# These definitions are from config.sh (via /usr/lib64/perl5/5.10.1/x86_64-linux-thread-multi/Config.pm).
# They may have been overridden via Makefile.PL or on the command line.
AR = ar
CC = x86_64-pc-linux-gnu-gcc
CCCDLFLAGS = -fPIC
CCDLFLAGS = -Wl,-E
DLEXT = so
DLSRC = dl_dlopen.xs
EXE_EXT = 
FULL_AR = /usr/bin/ar
LD = x86_64-pc-linux-gnu-gcc
LDDLFLAGS = -shared -O2 -march=core2 -pipe -fstack-protector
LDFLAGS =  -fstack-protector
LIBC = /lib/libc-2.10.1.so
LIB_EXT = .a
OBJ_EXT = .o
OSNAME = linux
OSVERS = 2.6.30-gentoo-r4-aswan
RANLIB = :
SITELIBEXP = /usr/lib64/perl5/site_perl/5.10.1
SITEARCHEXP = /usr/lib64/perl5/site_perl/5.10.1/x86_64-linux-thread-multi
SO = so
VENDORARCHEXP = /usr/lib64/perl5/vendor_perl/5.10.1/x86_64-linux-thread-multi
VENDORLIBEXP = /usr/lib64/perl5/vendor_perl/5.10.1


# --- MakeMaker constants section:
AR_STATIC_ARGS = cr
DIRFILESEP = /
DFSEP = $(DIRFILESEP)
NAME = PDT::Server
NAME_SYM = PDT_Server
VERSION = 0.001
VERSION_MACRO = VERSION
VERSION_SYM = 0_001
DEFINE_VERSION = -D$(VERSION_MACRO)=\"$(VERSION)\"
XS_VERSION = 0.001
XS_VERSION_MACRO = XS_VERSION
XS_DEFINE_VERSION = -D$(XS_VERSION_MACRO)=\"$(XS_VERSION)\"
INST_ARCHLIB = blib/arch
INST_SCRIPT = blib/script
INST_BIN = blib/bin
INST_LIB = blib/lib
INST_MAN1DIR = blib/man1
INST_MAN3DIR = blib/man3
MAN1EXT = 1
MAN3EXT = 3
INSTALLDIRS = site
DESTDIR = 
PREFIX = $(SITEPREFIX)
PERLPREFIX = /usr
SITEPREFIX = /usr
VENDORPREFIX = /usr
INSTALLPRIVLIB = /usr/lib64/perl5/5.10.1
DESTINSTALLPRIVLIB = $(DESTDIR)$(INSTALLPRIVLIB)
INSTALLSITELIB = /usr/lib64/perl5/site_perl/5.10.1
DESTINSTALLSITELIB = $(DESTDIR)$(INSTALLSITELIB)
INSTALLVENDORLIB = /usr/lib64/perl5/vendor_perl/5.10.1
DESTINSTALLVENDORLIB = $(DESTDIR)$(INSTALLVENDORLIB)
INSTALLARCHLIB = /usr/lib64/perl5/5.10.1/x86_64-linux-thread-multi
DESTINSTALLARCHLIB = $(DESTDIR)$(INSTALLARCHLIB)
INSTALLSITEARCH = /usr/lib64/perl5/site_perl/5.10.1/x86_64-linux-thread-multi
DESTINSTALLSITEARCH = $(DESTDIR)$(INSTALLSITEARCH)
INSTALLVENDORARCH = /usr/lib64/perl5/vendor_perl/5.10.1/x86_64-linux-thread-multi
DESTINSTALLVENDORARCH = $(DESTDIR)$(INSTALLVENDORARCH)
INSTALLBIN = /usr/bin
DESTINSTALLBIN = $(DESTDIR)$(INSTALLBIN)
INSTALLSITEBIN = /usr/bin
DESTINSTALLSITEBIN = $(DESTDIR)$(INSTALLSITEBIN)
INSTALLVENDORBIN = /usr/bin
DESTINSTALLVENDORBIN = $(DESTDIR)$(INSTALLVENDORBIN)
INSTALLSCRIPT = /usr/bin
DESTINSTALLSCRIPT = $(DESTDIR)$(INSTALLSCRIPT)
INSTALLSITESCRIPT = /usr/bin
DESTINSTALLSITESCRIPT = $(DESTDIR)$(INSTALLSITESCRIPT)
INSTALLVENDORSCRIPT = /usr/bin
DESTINSTALLVENDORSCRIPT = $(DESTDIR)$(INSTALLVENDORSCRIPT)
INSTALLMAN1DIR = /usr/share/man/man1
DESTINSTALLMAN1DIR = $(DESTDIR)$(INSTALLMAN1DIR)
INSTALLSITEMAN1DIR = /usr/share/man/man1
DESTINSTALLSITEMAN1DIR = $(DESTDIR)$(INSTALLSITEMAN1DIR)
INSTALLVENDORMAN1DIR = /usr/share/man/man1
DESTINSTALLVENDORMAN1DIR = $(DESTDIR)$(INSTALLVENDORMAN1DIR)
INSTALLMAN3DIR = /usr/share/man/man3
DESTINSTALLMAN3DIR = $(DESTDIR)$(INSTALLMAN3DIR)
INSTALLSITEMAN3DIR = /usr/share/man/man3
DESTINSTALLSITEMAN3DIR = $(DESTDIR)$(INSTALLSITEMAN3DIR)
INSTALLVENDORMAN3DIR = /usr/share/man/man3
DESTINSTALLVENDORMAN3DIR = $(DESTDIR)$(INSTALLVENDORMAN3DIR)
PERL_LIB =
PERL_ARCHLIB = /usr/lib64/perl5/5.10.1/x86_64-linux-thread-multi
LIBPERL_A = libperl.a
FIRST_MAKEFILE = Makefile
MAKEFILE_OLD = Makefile.old
MAKE_APERL_FILE = Makefile.aperl
PERLMAINCC = $(CC)
PERL_INC = /usr/lib64/perl5/5.10.1/x86_64-linux-thread-multi/CORE
PERL = /usr/bin/perl5.10.1 "-Iinc"
FULLPERL = /usr/bin/perl5.10.1 "-Iinc"
ABSPERL = $(PERL)
PERLRUN = $(PERL)
FULLPERLRUN = $(FULLPERL)
ABSPERLRUN = $(ABSPERL)
PERLRUNINST = $(PERLRUN) "-I$(INST_ARCHLIB)" "-Iinc" "-I$(INST_LIB)"
FULLPERLRUNINST = $(FULLPERLRUN) "-I$(INST_ARCHLIB)" "-Iinc" "-I$(INST_LIB)"
ABSPERLRUNINST = $(ABSPERLRUN) "-I$(INST_ARCHLIB)" "-Iinc" "-I$(INST_LIB)"
PERL_CORE = 0
PERM_RW = 644
PERM_RWX = 755

MAKEMAKER   = /usr/lib64/perl5/vendor_perl/5.10.0/ExtUtils/MakeMaker.pm
MM_VERSION  = 6.50
MM_REVISION = 65000

# FULLEXT = Pathname for extension directory (eg Foo/Bar/Oracle).
# BASEEXT = Basename part of FULLEXT. May be just equal FULLEXT. (eg Oracle)
# PARENT_NAME = NAME without BASEEXT and no trailing :: (eg Foo::Bar)
# DLBASE  = Basename part of dynamic library. May be just equal BASEEXT.
MAKE = make
FULLEXT = PDT/Server
BASEEXT = Server
PARENT_NAME = PDT
DLBASE = $(BASEEXT)
VERSION_FROM = 
OBJECT = 
LDFROM = $(OBJECT)
LINKTYPE = dynamic
BOOTDEP = 

# Handy lists of source code files:
XS_FILES = 
C_FILES  = 
O_FILES  = 
H_FILES  = 
MAN1PODS = script/pdt_server_cgi.pl \
	script/pdt_server_create.pl \
	script/pdt_server_fastcgi.pl \
	script/pdt_server_server.pl \
	script/pdt_server_test.pl
MAN3PODS = lib/PDT/Server.pm \
	lib/PDT/Server/Controller/Account.pm \
	lib/PDT/Server/Controller/Answer.pm \
	lib/PDT/Server/Controller/Captcha.pm \
	lib/PDT/Server/Controller/Checkin.pm \
	lib/PDT/Server/Controller/Cron.pm \
	lib/PDT/Server/Controller/Fetch.pm \
	lib/PDT/Server/Controller/Host.pm \
	lib/PDT/Server/Controller/Login.pm \
	lib/PDT/Server/Controller/Logout.pm \
	lib/PDT/Server/Controller/Register.pm \
	lib/PDT/Server/Controller/Request.pm \
	lib/PDT/Server/Controller/Result.pm \
	lib/PDT/Server/Controller/Root.pm \
	lib/PDT/Server/Controller/Stats.pm \
	lib/PDT/Server/Validator.pm \
	lib/PDT/Server/View/Mason.pm

# Where is the Config information that we are using/depend on
CONFIGDEP = $(PERL_ARCHLIB)$(DFSEP)Config.pm $(PERL_INC)$(DFSEP)config.h

# Where to build things
INST_LIBDIR      = $(INST_LIB)/PDT
INST_ARCHLIBDIR  = $(INST_ARCHLIB)/PDT

INST_AUTODIR     = $(INST_LIB)/auto/$(FULLEXT)
INST_ARCHAUTODIR = $(INST_ARCHLIB)/auto/$(FULLEXT)

INST_STATIC      = 
INST_DYNAMIC     = 
INST_BOOT        = 

# Extra linker info
EXPORT_LIST        = 
PERL_ARCHIVE       = 
PERL_ARCHIVE_AFTER = 


TO_INST_PM = lib/PDT/Server.pm \
	lib/PDT/Server/Account.pm \
	lib/PDT/Server/Answer.pm \
	lib/PDT/Server/Architecture.pm \
	lib/PDT/Server/Config.pm \
	lib/PDT/Server/Controller/Account.pm \
	lib/PDT/Server/Controller/Answer.pm \
	lib/PDT/Server/Controller/Captcha.pm \
	lib/PDT/Server/Controller/Checkin.pm \
	lib/PDT/Server/Controller/Cron.pm \
	lib/PDT/Server/Controller/Fetch.pm \
	lib/PDT/Server/Controller/Host.pm \
	lib/PDT/Server/Controller/Login.pm \
	lib/PDT/Server/Controller/Logout.pm \
	lib/PDT/Server/Controller/Register.pm \
	lib/PDT/Server/Controller/Request.pm \
	lib/PDT/Server/Controller/Result.pm \
	lib/PDT/Server/Controller/Root.pm \
	lib/PDT/Server/Controller/Stats.pm \
	lib/PDT/Server/Host.pm \
	lib/PDT/Server/Host/Checkin.pm \
	lib/PDT/Server/Host/Plugin.pm \
	lib/PDT/Server/Operatingsystem.pm \
	lib/PDT/Server/Plugin.pm \
	lib/PDT/Server/Request.pm \
	lib/PDT/Server/Schema.pm \
	lib/PDT/Server/Test.pm \
	lib/PDT/Server/Test/Data.pm \
	lib/PDT/Server/Util/Transactions.pm \
	lib/PDT/Server/Validator.pm \
	lib/PDT/Server/Validator/Basic.pm \
	lib/PDT/Server/View/Mason.pm

PM_TO_BLIB = lib/PDT/Server/Controller/Register.pm \
	blib/lib/PDT/Server/Controller/Register.pm \
	lib/PDT/Server/Controller/Request.pm \
	blib/lib/PDT/Server/Controller/Request.pm \
	lib/PDT/Server/Account.pm \
	blib/lib/PDT/Server/Account.pm \
	lib/PDT/Server/Test.pm \
	blib/lib/PDT/Server/Test.pm \
	lib/PDT/Server/Validator/Basic.pm \
	blib/lib/PDT/Server/Validator/Basic.pm \
	lib/PDT/Server/Controller/Answer.pm \
	blib/lib/PDT/Server/Controller/Answer.pm \
	lib/PDT/Server/Answer.pm \
	blib/lib/PDT/Server/Answer.pm \
	lib/PDT/Server/Controller/Captcha.pm \
	blib/lib/PDT/Server/Controller/Captcha.pm \
	lib/PDT/Server/Plugin.pm \
	blib/lib/PDT/Server/Plugin.pm \
	lib/PDT/Server/Validator.pm \
	blib/lib/PDT/Server/Validator.pm \
	lib/PDT/Server/Util/Transactions.pm \
	blib/lib/PDT/Server/Util/Transactions.pm \
	lib/PDT/Server/Controller/Root.pm \
	blib/lib/PDT/Server/Controller/Root.pm \
	lib/PDT/Server/Controller/Host.pm \
	blib/lib/PDT/Server/Controller/Host.pm \
	lib/PDT/Server.pm \
	blib/lib/PDT/Server.pm \
	lib/PDT/Server/Controller/Cron.pm \
	blib/lib/PDT/Server/Controller/Cron.pm \
	lib/PDT/Server/Controller/Login.pm \
	blib/lib/PDT/Server/Controller/Login.pm \
	lib/PDT/Server/View/Mason.pm \
	blib/lib/PDT/Server/View/Mason.pm \
	lib/PDT/Server/Test/Data.pm \
	blib/lib/PDT/Server/Test/Data.pm \
	lib/PDT/Server/Controller/Result.pm \
	blib/lib/PDT/Server/Controller/Result.pm \
	lib/PDT/Server/Host/Checkin.pm \
	blib/lib/PDT/Server/Host/Checkin.pm \
	lib/PDT/Server/Operatingsystem.pm \
	blib/lib/PDT/Server/Operatingsystem.pm \
	lib/PDT/Server/Controller/Fetch.pm \
	blib/lib/PDT/Server/Controller/Fetch.pm \
	lib/PDT/Server/Config.pm \
	blib/lib/PDT/Server/Config.pm \
	lib/PDT/Server/Controller/Stats.pm \
	blib/lib/PDT/Server/Controller/Stats.pm \
	lib/PDT/Server/Controller/Checkin.pm \
	blib/lib/PDT/Server/Controller/Checkin.pm \
	lib/PDT/Server/Request.pm \
	blib/lib/PDT/Server/Request.pm \
	lib/PDT/Server/Controller/Logout.pm \
	blib/lib/PDT/Server/Controller/Logout.pm \
	lib/PDT/Server/Controller/Account.pm \
	blib/lib/PDT/Server/Controller/Account.pm \
	lib/PDT/Server/Architecture.pm \
	blib/lib/PDT/Server/Architecture.pm \
	lib/PDT/Server/Host/Plugin.pm \
	blib/lib/PDT/Server/Host/Plugin.pm \
	lib/PDT/Server/Schema.pm \
	blib/lib/PDT/Server/Schema.pm \
	lib/PDT/Server/Host.pm \
	blib/lib/PDT/Server/Host.pm


# --- MakeMaker platform_constants section:
MM_Unix_VERSION = 6.50
PERL_MALLOC_DEF = -DPERL_EXTMALLOC_DEF -Dmalloc=Perl_malloc -Dfree=Perl_mfree -Drealloc=Perl_realloc -Dcalloc=Perl_calloc


# --- MakeMaker tool_autosplit section:
# Usage: $(AUTOSPLITFILE) FileToSplit AutoDirToSplitInto
AUTOSPLITFILE = $(ABSPERLRUN)  -e 'use AutoSplit;  autosplit($$ARGV[0], $$ARGV[1], 0, 1, 1)' --



# --- MakeMaker tool_xsubpp section:


# --- MakeMaker tools_other section:
SHELL = /bin/sh
CHMOD = chmod
CP = cp
MV = mv
NOOP = $(SHELL) -c true
NOECHO = @
RM_F = rm -f
RM_RF = rm -rf
TEST_F = test -f
TOUCH = touch
UMASK_NULL = umask 0
DEV_NULL = > /dev/null 2>&1
MKPATH = $(ABSPERLRUN) "-MExtUtils::Command" -e mkpath
EQUALIZE_TIMESTAMP = $(ABSPERLRUN) "-MExtUtils::Command" -e eqtime
ECHO = echo
ECHO_N = echo -n
UNINST = 0
VERBINST = 0
MOD_INSTALL = $(ABSPERLRUN) -MExtUtils::Install -e 'install({@ARGV}, '\''$(VERBINST)'\'', 0, '\''$(UNINST)'\'');' --
DOC_INSTALL = $(ABSPERLRUN) "-MExtUtils::Command::MM" -e perllocal_install
UNINSTALL = $(ABSPERLRUN) "-MExtUtils::Command::MM" -e uninstall
WARN_IF_OLD_PACKLIST = $(ABSPERLRUN) "-MExtUtils::Command::MM" -e warn_if_old_packlist
MACROSTART = 
MACROEND = 
USEMAKEFILE = -f
FIXIN = $(PERLRUN) "-MExtUtils::MY" -e "MY->fixin(shift)"


# --- MakeMaker makemakerdflt section:
makemakerdflt : all
	$(NOECHO) $(NOOP)


# --- MakeMaker dist section:
TAR = tar
TARFLAGS = cvf
ZIP = zip
ZIPFLAGS = -r
COMPRESS = gzip --best
SUFFIX = .gz
SHAR = shar
PREOP = $(PERL) -I. "-MModule::Install::Admin" -e "dist_preop(q($(DISTVNAME)))"
POSTOP = $(NOECHO) $(NOOP)
TO_UNIX = $(NOECHO) $(NOOP)
CI = ci -u
RCS_LABEL = rcs -Nv$(VERSION_SYM): -q
DIST_CP = best
DIST_DEFAULT = tardist
DISTNAME = PDT-Server
DISTVNAME = PDT-Server-0.001


# --- MakeMaker macro section:


# --- MakeMaker depend section:


# --- MakeMaker cflags section:


# --- MakeMaker const_loadlibs section:


# --- MakeMaker const_cccmd section:


# --- MakeMaker post_constants section:


# --- MakeMaker pasthru section:

PASTHRU = LIBPERL_A="$(LIBPERL_A)"\
	LINKTYPE="$(LINKTYPE)"\
	PREFIX="$(PREFIX)"


# --- MakeMaker special_targets section:
.SUFFIXES : .xs .c .C .cpp .i .s .cxx .cc $(OBJ_EXT)

.PHONY: all config static dynamic test linkext manifest blibdirs clean realclean disttest distdir



# --- MakeMaker c_o section:


# --- MakeMaker xs_c section:


# --- MakeMaker xs_o section:


# --- MakeMaker top_targets section:
all :: pure_all manifypods
	$(NOECHO) $(NOOP)


pure_all :: config pm_to_blib subdirs linkext
	$(NOECHO) $(NOOP)

subdirs :: $(MYEXTLIB)
	$(NOECHO) $(NOOP)

config :: $(FIRST_MAKEFILE) blibdirs
	$(NOECHO) $(NOOP)

help :
	perldoc ExtUtils::MakeMaker


# --- MakeMaker blibdirs section:
blibdirs : $(INST_LIBDIR)$(DFSEP).exists $(INST_ARCHLIB)$(DFSEP).exists $(INST_AUTODIR)$(DFSEP).exists $(INST_ARCHAUTODIR)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists $(INST_SCRIPT)$(DFSEP).exists $(INST_MAN1DIR)$(DFSEP).exists $(INST_MAN3DIR)$(DFSEP).exists
	$(NOECHO) $(NOOP)

# Backwards compat with 6.18 through 6.25
blibdirs.ts : blibdirs
	$(NOECHO) $(NOOP)

$(INST_LIBDIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_LIBDIR)
	$(NOECHO) $(CHMOD) 755 $(INST_LIBDIR)
	$(NOECHO) $(TOUCH) $(INST_LIBDIR)$(DFSEP).exists

$(INST_ARCHLIB)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_ARCHLIB)
	$(NOECHO) $(CHMOD) 755 $(INST_ARCHLIB)
	$(NOECHO) $(TOUCH) $(INST_ARCHLIB)$(DFSEP).exists

$(INST_AUTODIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_AUTODIR)
	$(NOECHO) $(CHMOD) 755 $(INST_AUTODIR)
	$(NOECHO) $(TOUCH) $(INST_AUTODIR)$(DFSEP).exists

$(INST_ARCHAUTODIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_ARCHAUTODIR)
	$(NOECHO) $(CHMOD) 755 $(INST_ARCHAUTODIR)
	$(NOECHO) $(TOUCH) $(INST_ARCHAUTODIR)$(DFSEP).exists

$(INST_BIN)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_BIN)
	$(NOECHO) $(CHMOD) 755 $(INST_BIN)
	$(NOECHO) $(TOUCH) $(INST_BIN)$(DFSEP).exists

$(INST_SCRIPT)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_SCRIPT)
	$(NOECHO) $(CHMOD) 755 $(INST_SCRIPT)
	$(NOECHO) $(TOUCH) $(INST_SCRIPT)$(DFSEP).exists

$(INST_MAN1DIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_MAN1DIR)
	$(NOECHO) $(CHMOD) 755 $(INST_MAN1DIR)
	$(NOECHO) $(TOUCH) $(INST_MAN1DIR)$(DFSEP).exists

$(INST_MAN3DIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_MAN3DIR)
	$(NOECHO) $(CHMOD) 755 $(INST_MAN3DIR)
	$(NOECHO) $(TOUCH) $(INST_MAN3DIR)$(DFSEP).exists



# --- MakeMaker linkext section:

linkext :: $(LINKTYPE)
	$(NOECHO) $(NOOP)


# --- MakeMaker dlsyms section:


# --- MakeMaker dynamic section:

dynamic :: $(FIRST_MAKEFILE) $(INST_DYNAMIC) $(INST_BOOT)
	$(NOECHO) $(NOOP)


# --- MakeMaker dynamic_bs section:

BOOTSTRAP =


# --- MakeMaker dynamic_lib section:


# --- MakeMaker static section:

## $(INST_PM) has been moved to the all: target.
## It remains here for awhile to allow for old usage: "make static"
static :: $(FIRST_MAKEFILE) $(INST_STATIC)
	$(NOECHO) $(NOOP)


# --- MakeMaker static_lib section:


# --- MakeMaker manifypods section:

POD2MAN_EXE = $(PERLRUN) "-MExtUtils::Command::MM" -e pod2man "--"
POD2MAN = $(POD2MAN_EXE)


manifypods : pure_all  \
	script/pdt_server_test.pl \
	script/pdt_server_fastcgi.pl \
	script/pdt_server_create.pl \
	script/pdt_server_cgi.pl \
	script/pdt_server_server.pl \
	lib/PDT/Server/Controller/Register.pm \
	lib/PDT/Server/Controller/Request.pm \
	lib/PDT/Server/Controller/Result.pm \
	lib/PDT/Server/Controller/Answer.pm \
	lib/PDT/Server/Controller/Fetch.pm \
	lib/PDT/Server/Controller/Stats.pm \
	lib/PDT/Server/Controller/Captcha.pm \
	lib/PDT/Server/Validator.pm \
	lib/PDT/Server/Controller/Checkin.pm \
	lib/PDT/Server/Controller/Logout.pm \
	lib/PDT/Server/Controller/Root.pm \
	lib/PDT/Server/Controller/Host.pm \
	lib/PDT/Server/Controller/Account.pm \
	lib/PDT/Server.pm \
	lib/PDT/Server/Controller/Cron.pm \
	lib/PDT/Server/Controller/Login.pm \
	lib/PDT/Server/View/Mason.pm
	$(NOECHO) $(POD2MAN) --section=1 --perm_rw=$(PERM_RW) \
	  script/pdt_server_test.pl $(INST_MAN1DIR)/pdt_server_test.pl.$(MAN1EXT) \
	  script/pdt_server_fastcgi.pl $(INST_MAN1DIR)/pdt_server_fastcgi.pl.$(MAN1EXT) \
	  script/pdt_server_create.pl $(INST_MAN1DIR)/pdt_server_create.pl.$(MAN1EXT) \
	  script/pdt_server_cgi.pl $(INST_MAN1DIR)/pdt_server_cgi.pl.$(MAN1EXT) \
	  script/pdt_server_server.pl $(INST_MAN1DIR)/pdt_server_server.pl.$(MAN1EXT) 
	$(NOECHO) $(POD2MAN) --section=3 --perm_rw=$(PERM_RW) \
	  lib/PDT/Server/Controller/Register.pm $(INST_MAN3DIR)/PDT::Server::Controller::Register.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Request.pm $(INST_MAN3DIR)/PDT::Server::Controller::Request.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Result.pm $(INST_MAN3DIR)/PDT::Server::Controller::Result.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Answer.pm $(INST_MAN3DIR)/PDT::Server::Controller::Answer.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Fetch.pm $(INST_MAN3DIR)/PDT::Server::Controller::Fetch.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Stats.pm $(INST_MAN3DIR)/PDT::Server::Controller::Stats.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Captcha.pm $(INST_MAN3DIR)/PDT::Server::Controller::Captcha.$(MAN3EXT) \
	  lib/PDT/Server/Validator.pm $(INST_MAN3DIR)/PDT::Server::Validator.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Checkin.pm $(INST_MAN3DIR)/PDT::Server::Controller::Checkin.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Logout.pm $(INST_MAN3DIR)/PDT::Server::Controller::Logout.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Root.pm $(INST_MAN3DIR)/PDT::Server::Controller::Root.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Host.pm $(INST_MAN3DIR)/PDT::Server::Controller::Host.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Account.pm $(INST_MAN3DIR)/PDT::Server::Controller::Account.$(MAN3EXT) \
	  lib/PDT/Server.pm $(INST_MAN3DIR)/PDT::Server.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Cron.pm $(INST_MAN3DIR)/PDT::Server::Controller::Cron.$(MAN3EXT) \
	  lib/PDT/Server/Controller/Login.pm $(INST_MAN3DIR)/PDT::Server::Controller::Login.$(MAN3EXT) \
	  lib/PDT/Server/View/Mason.pm $(INST_MAN3DIR)/PDT::Server::View::Mason.$(MAN3EXT) 




# --- MakeMaker processPL section:


# --- MakeMaker installbin section:

EXE_FILES = script/pdt_server_cgi.pl script/pdt_server_create.pl script/pdt_server_fastcgi.pl script/pdt_server_server.pl script/pdt_server_test.pl

pure_all :: $(INST_SCRIPT)/pdt_server_test.pl $(INST_SCRIPT)/pdt_server_fastcgi.pl $(INST_SCRIPT)/pdt_server_create.pl $(INST_SCRIPT)/pdt_server_cgi.pl $(INST_SCRIPT)/pdt_server_server.pl
	$(NOECHO) $(NOOP)

realclean ::
	$(RM_F) \
	  $(INST_SCRIPT)/pdt_server_test.pl $(INST_SCRIPT)/pdt_server_fastcgi.pl \
	  $(INST_SCRIPT)/pdt_server_create.pl $(INST_SCRIPT)/pdt_server_cgi.pl \
	  $(INST_SCRIPT)/pdt_server_server.pl 

$(INST_SCRIPT)/pdt_server_test.pl : script/pdt_server_test.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/pdt_server_test.pl
	$(CP) script/pdt_server_test.pl $(INST_SCRIPT)/pdt_server_test.pl
	$(FIXIN) $(INST_SCRIPT)/pdt_server_test.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/pdt_server_test.pl

$(INST_SCRIPT)/pdt_server_fastcgi.pl : script/pdt_server_fastcgi.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/pdt_server_fastcgi.pl
	$(CP) script/pdt_server_fastcgi.pl $(INST_SCRIPT)/pdt_server_fastcgi.pl
	$(FIXIN) $(INST_SCRIPT)/pdt_server_fastcgi.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/pdt_server_fastcgi.pl

$(INST_SCRIPT)/pdt_server_create.pl : script/pdt_server_create.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/pdt_server_create.pl
	$(CP) script/pdt_server_create.pl $(INST_SCRIPT)/pdt_server_create.pl
	$(FIXIN) $(INST_SCRIPT)/pdt_server_create.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/pdt_server_create.pl

$(INST_SCRIPT)/pdt_server_cgi.pl : script/pdt_server_cgi.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/pdt_server_cgi.pl
	$(CP) script/pdt_server_cgi.pl $(INST_SCRIPT)/pdt_server_cgi.pl
	$(FIXIN) $(INST_SCRIPT)/pdt_server_cgi.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/pdt_server_cgi.pl

$(INST_SCRIPT)/pdt_server_server.pl : script/pdt_server_server.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/pdt_server_server.pl
	$(CP) script/pdt_server_server.pl $(INST_SCRIPT)/pdt_server_server.pl
	$(FIXIN) $(INST_SCRIPT)/pdt_server_server.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/pdt_server_server.pl



# --- MakeMaker subdirs section:

# none

# --- MakeMaker clean_subdirs section:
clean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker clean section:

# Delete temporary files but do not touch installed files. We don't delete
# the Makefile here so a later make realclean still has a makefile to use.

clean :: clean_subdirs
	- $(RM_F) \
	  *$(LIB_EXT) core \
	  core.[0-9] $(INST_ARCHAUTODIR)/extralibs.all \
	  core.[0-9][0-9] $(BASEEXT).bso \
	  pm_to_blib.ts core.[0-9][0-9][0-9][0-9] \
	  $(BASEEXT).x $(BOOTSTRAP) \
	  perl$(EXE_EXT) tmon.out \
	  *$(OBJ_EXT) pm_to_blib \
	  $(INST_ARCHAUTODIR)/extralibs.ld blibdirs.ts \
	  core.[0-9][0-9][0-9][0-9][0-9] *perl.core \
	  core.*perl.*.? $(MAKE_APERL_FILE) \
	  perl $(BASEEXT).def \
	  core.[0-9][0-9][0-9] mon.out \
	  lib$(BASEEXT).def perlmain.c \
	  perl.exe so_locations \
	  $(BASEEXT).exp 
	- $(RM_RF) \
	  blib 
	- $(MV) $(FIRST_MAKEFILE) $(MAKEFILE_OLD) $(DEV_NULL)


# --- MakeMaker realclean_subdirs section:
realclean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker realclean section:
# Delete temporary files (via clean) and also delete dist files
realclean purge ::  clean realclean_subdirs
	- $(RM_F) \
	  $(MAKEFILE_OLD) $(FIRST_MAKEFILE) 
	- $(RM_RF) \
	  MYMETA.yml $(DISTVNAME) 


# --- MakeMaker metafile section:
metafile :
	$(NOECHO) $(NOOP)


# --- MakeMaker signature section:
signature :
	cpansign -s


# --- MakeMaker dist_basics section:
distclean :: realclean distcheck
	$(NOECHO) $(NOOP)

distcheck :
	$(PERLRUN) "-MExtUtils::Manifest=fullcheck" -e fullcheck

skipcheck :
	$(PERLRUN) "-MExtUtils::Manifest=skipcheck" -e skipcheck

manifest :
	$(PERLRUN) "-MExtUtils::Manifest=mkmanifest" -e mkmanifest

veryclean : realclean
	$(RM_F) *~ */*~ *.orig */*.orig *.bak */*.bak *.old */*.old 



# --- MakeMaker dist_core section:

dist : $(DIST_DEFAULT) $(FIRST_MAKEFILE)
	$(NOECHO) $(ABSPERLRUN) -l -e 'print '\''Warning: Makefile possibly out of date with $(VERSION_FROM)'\''' \
	  -e '    if -e '\''$(VERSION_FROM)'\'' and -M '\''$(VERSION_FROM)'\'' < -M '\''$(FIRST_MAKEFILE)'\'';' --

tardist : $(DISTVNAME).tar$(SUFFIX)
	$(NOECHO) $(NOOP)

uutardist : $(DISTVNAME).tar$(SUFFIX)
	uuencode $(DISTVNAME).tar$(SUFFIX) $(DISTVNAME).tar$(SUFFIX) > $(DISTVNAME).tar$(SUFFIX)_uu

$(DISTVNAME).tar$(SUFFIX) : distdir
	$(PREOP)
	$(TO_UNIX)
	$(TAR) $(TARFLAGS) $(DISTVNAME).tar $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(COMPRESS) $(DISTVNAME).tar
	$(POSTOP)

zipdist : $(DISTVNAME).zip
	$(NOECHO) $(NOOP)

$(DISTVNAME).zip : distdir
	$(PREOP)
	$(ZIP) $(ZIPFLAGS) $(DISTVNAME).zip $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(POSTOP)

shdist : distdir
	$(PREOP)
	$(SHAR) $(DISTVNAME) > $(DISTVNAME).shar
	$(RM_RF) $(DISTVNAME)
	$(POSTOP)


# --- MakeMaker distdir section:
create_distdir :
	$(RM_RF) $(DISTVNAME)
	$(PERLRUN) "-MExtUtils::Manifest=manicopy,maniread" \
		-e "manicopy(maniread(),'$(DISTVNAME)', '$(DIST_CP)');"

distdir : create_distdir  
	$(NOECHO) $(NOOP)



# --- MakeMaker dist_test section:
disttest : distdir
	cd $(DISTVNAME) && $(ABSPERLRUN) Makefile.PL 
	cd $(DISTVNAME) && $(MAKE) $(PASTHRU)
	cd $(DISTVNAME) && $(MAKE) test $(PASTHRU)



# --- MakeMaker dist_ci section:

ci :
	$(PERLRUN) "-MExtUtils::Manifest=maniread" \
	  -e "@all = keys %{ maniread() };" \
	  -e "print(qq{Executing $(CI) @all\n}); system(qq{$(CI) @all});" \
	  -e "print(qq{Executing $(RCS_LABEL) ...\n}); system(qq{$(RCS_LABEL) @all});"


# --- MakeMaker distmeta section:
distmeta : create_distdir metafile
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'eval { maniadd({q{META.yml} => q{Module meta-data (added by MakeMaker)}}) } ' \
	  -e '    or print "Could not add META.yml to MANIFEST: $${'\''@'\''}\n"' --



# --- MakeMaker distsignature section:
distsignature : create_distdir
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'eval { maniadd({q{SIGNATURE} => q{Public-key signature (added by MakeMaker)}}) } ' \
	  -e '    or print "Could not add SIGNATURE to MANIFEST: $${'\''@'\''}\n"' --
	$(NOECHO) cd $(DISTVNAME) && $(TOUCH) SIGNATURE
	cd $(DISTVNAME) && cpansign -s



# --- MakeMaker install section:

install :: all pure_install doc_install
	$(NOECHO) $(NOOP)

install_perl :: all pure_perl_install doc_perl_install
	$(NOECHO) $(NOOP)

install_site :: all pure_site_install doc_site_install
	$(NOECHO) $(NOOP)

install_vendor :: all pure_vendor_install doc_vendor_install
	$(NOECHO) $(NOOP)

pure_install :: pure_$(INSTALLDIRS)_install
	$(NOECHO) $(NOOP)

doc_install :: doc_$(INSTALLDIRS)_install
	$(NOECHO) $(NOOP)

pure__install : pure_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

doc__install : doc_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

pure_perl_install ::
	$(NOECHO) $(MOD_INSTALL) \
		read $(PERL_ARCHLIB)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLARCHLIB)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
		$(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
		$(INST_BIN) $(DESTINSTALLBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLMAN3DIR)
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		$(SITEARCHEXP)/auto/$(FULLEXT)


pure_site_install ::
	$(NOECHO) $(MOD_INSTALL) \
		read $(SITEARCHEXP)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLSITEARCH)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLSITELIB) \
		$(INST_ARCHLIB) $(DESTINSTALLSITEARCH) \
		$(INST_BIN) $(DESTINSTALLSITEBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSITESCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLSITEMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLSITEMAN3DIR)
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		$(PERL_ARCHLIB)/auto/$(FULLEXT)

pure_vendor_install ::
	$(NOECHO) $(MOD_INSTALL) \
		read $(VENDORARCHEXP)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLVENDORARCH)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
		$(INST_ARCHLIB) $(DESTINSTALLVENDORARCH) \
		$(INST_BIN) $(DESTINSTALLVENDORBIN) \
		$(INST_SCRIPT) $(DESTINSTALLVENDORSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLVENDORMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLVENDORMAN3DIR)

doc_perl_install ::
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLPRIVLIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLARCHLIB)/perllocal.pod

doc_site_install ::
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLSITELIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLARCHLIB)/perllocal.pod

doc_vendor_install ::
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLVENDORLIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLARCHLIB)/perllocal.pod


uninstall :: uninstall_from_$(INSTALLDIRS)dirs
	$(NOECHO) $(NOOP)

uninstall_from_perldirs ::
	$(NOECHO) $(UNINSTALL) $(PERL_ARCHLIB)/auto/$(FULLEXT)/.packlist

uninstall_from_sitedirs ::
	$(NOECHO) $(UNINSTALL) $(SITEARCHEXP)/auto/$(FULLEXT)/.packlist

uninstall_from_vendordirs ::
	$(NOECHO) $(UNINSTALL) $(VENDORARCHEXP)/auto/$(FULLEXT)/.packlist


# --- MakeMaker force section:
# Phony target to force checking subdirectories.
FORCE :
	$(NOECHO) $(NOOP)


# --- MakeMaker perldepend section:


# --- MakeMaker makefile section:
# We take a very conservative approach here, but it's worth it.
# We move Makefile to Makefile.old here to avoid gnu make looping.
$(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
	$(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
	$(NOECHO) $(ECHO) "Cleaning current config before rebuilding Makefile..."
	-$(NOECHO) $(RM_F) $(MAKEFILE_OLD)
	-$(NOECHO) $(MV)   $(FIRST_MAKEFILE) $(MAKEFILE_OLD)
	- $(MAKE) $(USEMAKEFILE) $(MAKEFILE_OLD) clean $(DEV_NULL)
	$(PERLRUN) Makefile.PL 
	$(NOECHO) $(ECHO) "==> Your Makefile has been rebuilt. <=="
	$(NOECHO) $(ECHO) "==> Please rerun the $(MAKE) command.  <=="
	false



# --- MakeMaker staticmake section:

# --- MakeMaker makeaperl section ---
MAP_TARGET    = perl
FULLPERL      = /usr/bin/perl5.10.1

$(MAP_TARGET) :: static $(MAKE_APERL_FILE)
	$(MAKE) $(USEMAKEFILE) $(MAKE_APERL_FILE) $@

$(MAKE_APERL_FILE) : $(FIRST_MAKEFILE) pm_to_blib
	$(NOECHO) $(ECHO) Writing \"$(MAKE_APERL_FILE)\" for this $(MAP_TARGET)
	$(NOECHO) $(PERLRUNINST) \
		Makefile.PL DIR= \
		MAKEFILE=$(MAKE_APERL_FILE) LINKTYPE=static \
		MAKEAPERL=1 NORECURS=1 CCCDLFLAGS=


# --- MakeMaker test section:

TEST_VERBOSE=0
TEST_TYPE=test_$(LINKTYPE)
TEST_FILE = test.pl
TEST_FILES = t/00-testers/*.t t/01-backend/*.t t/02-frontend/*.t
TESTDB_SW = -d

testdb :: testdb_$(LINKTYPE)

test :: $(TEST_TYPE) subdirs-test

subdirs-test ::
	$(NOECHO) $(NOOP)


test_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) "-MExtUtils::Command::MM" "-e" "test_harness($(TEST_VERBOSE), 'inc', '$(INST_LIB)', '$(INST_ARCHLIB)')" $(TEST_FILES)

testdb_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) $(TESTDB_SW) "-Iinc" "-I$(INST_LIB)" "-I$(INST_ARCHLIB)" $(TEST_FILE)

test_ : test_dynamic

test_static :: test_dynamic
testdb_static :: testdb_dynamic


# --- MakeMaker ppd section:
# Creates a PPD (Perl Package Description) for a binary distribution.
ppd :
	$(NOECHO) $(ECHO) '<SOFTPKG NAME="$(DISTNAME)" VERSION="0,001,0,0">' > $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <TITLE>$(DISTNAME)</TITLE>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <ABSTRACT>Catalyst based application</ABSTRACT>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <AUTHOR>Catalyst developer</AUTHOR>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Catalyst-Action-RenderView" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Catalyst-Plugin-ConfigLoader" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Catalyst-Plugin-Session" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Catalyst-Plugin-Session-State-Cookie" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Catalyst-Plugin-Session-Store-FastMmap" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Catalyst-Plugin-Static-Simple" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Catalyst-Runtime" VERSION="5,80016,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Catalyst-View-Mason" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="DBD-Pg" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Data-Dumper" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Digest-SHA" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="ExtUtils-MakeMaker" VERSION="6,42,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Fey-DBIManager" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Fey-Loader" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Fey-ORM" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="GD-SecurityImage" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Module-Pluggable" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Moose" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="MooseX-ClassAttribute" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="MooseX-Types" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="PDT-Config" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Test-Exception" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Test-More" VERSION="0,94,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="YAML-Syck" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="namespace-autoclean" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <OS NAME="$(OSNAME)" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <ARCHITECTURE NAME="x86_64-linux-thread-multi-5.1" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <CODEBASE HREF="" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    </IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '</SOFTPKG>' >> $(DISTNAME).ppd


# --- MakeMaker pm_to_blib section:

pm_to_blib : $(TO_INST_PM)
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', '\''$(PM_FILTER)'\'')' -- \
	  lib/PDT/Server/Controller/Register.pm blib/lib/PDT/Server/Controller/Register.pm \
	  lib/PDT/Server/Controller/Request.pm blib/lib/PDT/Server/Controller/Request.pm \
	  lib/PDT/Server/Account.pm blib/lib/PDT/Server/Account.pm \
	  lib/PDT/Server/Test.pm blib/lib/PDT/Server/Test.pm \
	  lib/PDT/Server/Validator/Basic.pm blib/lib/PDT/Server/Validator/Basic.pm \
	  lib/PDT/Server/Controller/Answer.pm blib/lib/PDT/Server/Controller/Answer.pm \
	  lib/PDT/Server/Answer.pm blib/lib/PDT/Server/Answer.pm \
	  lib/PDT/Server/Controller/Captcha.pm blib/lib/PDT/Server/Controller/Captcha.pm \
	  lib/PDT/Server/Plugin.pm blib/lib/PDT/Server/Plugin.pm \
	  lib/PDT/Server/Validator.pm blib/lib/PDT/Server/Validator.pm \
	  lib/PDT/Server/Util/Transactions.pm blib/lib/PDT/Server/Util/Transactions.pm \
	  lib/PDT/Server/Controller/Root.pm blib/lib/PDT/Server/Controller/Root.pm \
	  lib/PDT/Server/Controller/Host.pm blib/lib/PDT/Server/Controller/Host.pm \
	  lib/PDT/Server.pm blib/lib/PDT/Server.pm \
	  lib/PDT/Server/Controller/Cron.pm blib/lib/PDT/Server/Controller/Cron.pm \
	  lib/PDT/Server/Controller/Login.pm blib/lib/PDT/Server/Controller/Login.pm \
	  lib/PDT/Server/View/Mason.pm blib/lib/PDT/Server/View/Mason.pm \
	  lib/PDT/Server/Test/Data.pm blib/lib/PDT/Server/Test/Data.pm \
	  lib/PDT/Server/Controller/Result.pm blib/lib/PDT/Server/Controller/Result.pm \
	  lib/PDT/Server/Host/Checkin.pm blib/lib/PDT/Server/Host/Checkin.pm \
	  lib/PDT/Server/Operatingsystem.pm blib/lib/PDT/Server/Operatingsystem.pm \
	  lib/PDT/Server/Controller/Fetch.pm blib/lib/PDT/Server/Controller/Fetch.pm \
	  lib/PDT/Server/Config.pm blib/lib/PDT/Server/Config.pm \
	  lib/PDT/Server/Controller/Stats.pm blib/lib/PDT/Server/Controller/Stats.pm \
	  lib/PDT/Server/Controller/Checkin.pm blib/lib/PDT/Server/Controller/Checkin.pm \
	  lib/PDT/Server/Request.pm blib/lib/PDT/Server/Request.pm \
	  lib/PDT/Server/Controller/Logout.pm blib/lib/PDT/Server/Controller/Logout.pm \
	  lib/PDT/Server/Controller/Account.pm blib/lib/PDT/Server/Controller/Account.pm \
	  lib/PDT/Server/Architecture.pm blib/lib/PDT/Server/Architecture.pm \
	  lib/PDT/Server/Host/Plugin.pm blib/lib/PDT/Server/Host/Plugin.pm \
	  lib/PDT/Server/Schema.pm blib/lib/PDT/Server/Schema.pm \
	  lib/PDT/Server/Host.pm blib/lib/PDT/Server/Host.pm 
	$(NOECHO) $(TOUCH) pm_to_blib


# --- MakeMaker selfdocument section:


# --- MakeMaker postamble section:
test-testers:
	prove -I lib t/00-testers/*.t

test-backend:
	prove -I lib t/00-testers/*.t t/01-backend/*.t

test-frontend:
	prove -I lib t/02-frontend/*.t

dbinit:
	dropdb pdt || true
	createdb pdt
	psql pdt < `ls database/psql/* | sort`


# End.
# Postamble by Module::Install 0.91
# --- Module::Install::Admin::Makefile section:

realclean purge ::
	$(RM_F) $(DISTVNAME).tar$(SUFFIX)
	$(RM_F) MANIFEST.bak _build
	$(PERL) "-Ilib" "-MModule::Install::Admin" -e "remove_meta()"
	$(RM_RF) inc

reset :: purge

upload :: test dist
	cpan-upload -verbose $(DISTVNAME).tar$(SUFFIX)

grok ::
	perldoc Module::Install

distsign ::
	cpansign -s

catalyst_par :: all
	$(NOECHO) $(PERL) -Ilib -Minc::Module::Install -MModule::Install::Catalyst -e"Catalyst::Module::Install::_catalyst_par( '', 'PDT-Server', { CLASSES => [], CORE => 0, ENGINE => 'CGI', MULTIARCH => 0, SCRIPT => '', USAGE => q## } )"
# --- Module::Install::AutoInstall section:

config :: installdeps
	$(NOECHO) $(NOOP)

checkdeps ::
	$(PERL) ./Makefile.PL --checkdeps

installdeps ::
	$(NOECHO) $(NOOP)


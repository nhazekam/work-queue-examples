# Generated at Tue Jun  4 10:48:54 EDT 2019 by nhazekam@disc24.crc.nd.edu

CCTOOLS_HOME=/afs/crc.nd.edu/user/n/nhazekam/cctools
CCTOOLS_INSTALL_DIR=/afs/crc.nd.edu/user/n/nhazekam/cctools/
SAND_INSTALL_DIR=/afs/crc.nd.edu/user/n/nhazekam/work-queue-examples/C/sand

CC=@echo COMPILE $@;gcc

BASE_CCFLAGS= -D__EXTENSIONS__ -D_LARGEFILE64_SOURCE -D__LARGE64_FILES -Wall -Wextra -Wno-unused-parameter -Wno-unknown-pragmas -Wno-deprecated-declarations -Wno-unused-const-variable -fPIC -DHAS_EXT2FS -DHAS_LIBREADLINE -DHAVE_GMTIME_R -DHAVE_FDATASYNC -DHAS_ISNAN -DHAVE_ISNAN -DSQLITE_HAVE_ISNAN -DHAVE_LOCALTIME_R -DHAS_OPENAT -DHAS_PREAD -DUSE_PREAD -DUSE_PREAD64 -DHAS_PWRITE -DUSE_PWRITE -DUSE_PWRITE64 -DHAVE_STRCHRNUL -DHAS_STRSIGNAL -DHAS_USLEEP -DHAVE_USLEEP -DHAS_UTIME -DHAVE_UTIME -DHAS_UTIMENSAT -DHAS_ATTR_XATTR_H -DHAS_SYS_XATTR_H -DHAS_IFADDRS -DHAS_INTTYPES_H -DHAVE_INTTYPES_H -DHAS_STDINT_H -DHAVE_STDINT_H -DHAS_SYS_STATFS_H -DHAS_SYS_STATVFS_H -DHAS_SYSLOG_H -DBUILD_DATE='"2019-06-04 10:48:53 -0400"' -DBUILD_HOST='"disc24.crc.nd.edu"' -DBUILD_USER='"nhazekam"' -DCCTOOLS_COMMIT='""' -DCCTOOLS_CONFIGURE_ARGUMENTS='"--prefix /afs/crc.nd.edu/user/n/nhazekam/cctools/"' -DCCTOOLS_CPU_X86_64 -DCCTOOLS_CVMFS_BUILD_FLAGS='" "' -DCCTOOLS_OPSYS_LINUX -DCCTOOLS_RELEASE_DATE='"2019-06-04 10:48:53 -0400"' -DCCTOOLS_SOURCE='"DEVELOPMENT"' -DCCTOOLS_SYSTEM_INFORMATION='"Linux disc24.crc.nd.edu 3.10.0-957.12.2.el7.x86_64 \#1 SMP Fri Apr 19 21:09:07 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux"' -DCCTOOLS_VERSION='"8.0.0 DEVELOPMENT"' -DCCTOOLS_VERSION_MAJOR=8 -DCCTOOLS_VERSION_MICRO=0 -DCCTOOLS_VERSION_MINOR=0 -DINSTALL_PATH='"/afs/crc.nd.edu/user/n/nhazekam/cctools/"' -D_GNU_SOURCE -D_REENTRANT -g

CCFLAGS= -I${CCTOOLS_INSTALL_DIR}/include/cctools/ ${BASE_CCFLAGS} -std=c99

CXX=@echo COMPILE $@;g++

BASE_CXXFLAGS=${BASE_CCFLAGS}

CXXFLAGS=${BASE_CCFLAGS}

LD = @echo LINK $@;gcc

BASE_LDFLAGS =  -Xlinker -Bstatic -static-libgcc -Xlinker -Bdynamic -Xlinker --as-needed -g

INTERNAL_LDFLAGS = $(BASE_LDFLAGS) 

EXTERNAL_LINKAGE =  -lresolv -lnsl -lrt -ldl -lz -lstdc++ -lpthread -lz -lc -lm

LDFLAGS = -L$(INSTALL_DIR)/lib $(BASE_LDFLAGS)

READLINE_LDFLAGS=-lreadline -Xlinker --no-as-needed -lncurses -lhistory -Xlinker --as-needed

AR=ar


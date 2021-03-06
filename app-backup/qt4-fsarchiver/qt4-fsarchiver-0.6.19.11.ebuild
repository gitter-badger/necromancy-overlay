# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $ necrose99 Proxy Maintainer
# ssh-fs & cifs / samba are highly recomened for network backups and LIVE rescue type disk/s

EAPI="5"

inherit qt4-r2 eutils versionator

MY_P="${PN}-$(replace_version_separator 3 '-')"

DESCRIPTION="qt4-fsarchiver a program with a graphical interface for easy operation the archiving program fsarchiver (Flexible filesystem archiver) for backup and deployment tool"
HOMEPAGE="http://qt4-fsarchiver.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/source/${MY_P}.tar.gz
https://github.com/necrose99/qt4-fsarchiver/raw/master/SRC-TARBALLS/${MY_P}.tar.gz"
  LICENSE="GPL-2"
SLOT="0"
    KEYWORDS="~amd64 ~x86"
    IUSE="+onbydefault +btrfs +jfs +ntfs reiser4 +reiserfs +xfss +sshfs"

  DEPEND="app-arch/xz-utils
    app-backup/fsarchiver[lzma,lzo]
    dev-libs/glib:2
    dev-libs/libgcrypt
    dev-libs/lzo
    >=sys-fs/e2fsprogs-1.41.4
    x11-libs/qt-core:4
    x11-libs/qt-gui:4"
    
          RDEPEND="${DEPEND}
          btrfs? ( sys-fs/btrfs-progs )
          jfs? ( sys-fs/jfsutils )
          ntfs? ( sys-fs/ntfs3g[ntfsprogs] )
          reiser4? ( sys-fs/reiser4progs )
          reiserfs? ( sys-fs/reiserfsprogs )
          xfs? ( sys-fs/xfsprogs )
          sshfs? (sys-fs/sshfs-fuse)"

S="${WORKDIR}/${PN}"
src_prepare() {
epatch "${DISTDIR}"/Gentoo-qt4-fsarchiver-pro.diff
# fix .desktop file
sed -i -e '/Encoding/d' starter/"${PN}".desktop || die "sed on qt4-fsarchiver.desktop failed"

qt4-r2_src_prepare
}

src_configure() {
eqmake4 "${PN}".pro OPTION_LZO_SUPPORT=1 OPTION_LZMA_SUPPORT=1
}

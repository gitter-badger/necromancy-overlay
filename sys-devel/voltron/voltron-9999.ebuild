# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy2_0 )

inherit distutils-r1 git-r3

EGIT_REPO_URI="git://github.com/snarez/${PN}.git"

DESCRIPTION="A half-arsed UI module for GDB & LLDB"
HOMEPAGE="https://github.com/snarez/voltron"

LICENSE="BEER"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/scruffy
		dev-python/rl"
RDEPEND="${DEPEND}"

python_install_all() {
        local DOCS=( README.md )
        distutils-r1_python_install_all
}

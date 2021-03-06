# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy2_0 )

inherit distutils-r1  git-3 multilib

if [[ ${PV} = 9999 ]]; then
	EGIT_REPO_URI="git://github.com/snarez/${PN}.git"
	EGIT_BOOTSTRAP=""
	KEYWORDS=""
else
	SRC_URI="${HOMEPAGE}/archive/${PV}.zip"
	KEYWORDS="~amd64 ~x86"
fi
DESCRIPTION="Alternative Python bindings for GNU Readline"
HOMEPAGE="https://github.com/stefanholek/rl"

LICENSE="GPL-2"
SLOT="0"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

python_install_all() {
        local DOCS=( README.txt )
        distutils-r1_python_install_all
}

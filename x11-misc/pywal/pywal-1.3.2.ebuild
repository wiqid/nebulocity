# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Generate and change colorschemes on the fly"
HOMEPAGE="https://github.com/dylanaraps/pywal"
SRC_URI="https://github.com/dylanaraps/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	media-gfx/imagemagick"

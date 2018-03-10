# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils gnome2-utils qmake-utils xdg-utils

if [[ ${PV} != *9999* ]]; then
	SRC_URI="mirror://sourceforge/${PN}/src/${P}.tar.xz"
	KEYWORDS="~amd64"
else
	EGIT_REPO_URI="git://github.com/pbek/QOwnNotes.git"
	inherit eutils git-r3 qmake-utils
fi

DESCRIPTION="Plain-text file notepad with markdown support and ownCloud integration"
HOMEPAGE="http://www.qownnotes.org"

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtsql:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	dev-qt/qtxmlpatterns:5"
DEPEND="${RDEPEND}"

DOCS=( CHANGELOG.md README.md SHORTCUTS.md )

src_prepare() {
	echo "#define RELEASE \"Gentoo\"" > release.h
	default
}

src_configure() {
	eqmake5 QOwnNotes.pro
}

src_install() {
	dobin QOwnNotes
	einstalldocs

	doicon -s 128 images/icons/128x128/apps/QOwnNotes.png
	doicon -s scalable images/icons/scalable/apps/QOwnNotes.svg
	domenu QOwnNotes.desktop
}

pkg_postinst() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}

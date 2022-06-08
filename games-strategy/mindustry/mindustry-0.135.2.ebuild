EAPI=8
JAVA_PKG_IUSE="source"

inherit wrapper

DESCRITPION="Mindustry: A sandbox tower-defense game."
HOMEPAGE="https://mindustrygame.github.io/"
SRC_URI="https://github.com/Anuken/Mindustry/archive/refs/tags/v135.2.tar.gz"

LICENSE="GNU General Public License v3.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
S="${WORKDIR}/Mindustry-135.2"

DEPEND=">=virtual/jdk-17:*"
RaDEPEND=">=virtual/jre-17:*"
BDEPEND=""

RESTRICT="network-sandbox"

JAVA_PKG_FORCE_VM="true"

src_prepare() {
    default
}

src_compile() {
	chmod +x ./gradlew
	elog <<< use source && java --version && GRADLE_USER_HOME="${T}" ./gradlew desktop:dist
}

src_install() {
	insinto "/opt/${PN}"
	newins "${S}/desktop/build/libs/Mindustry.jar" "${PN}.jar"

	make_wrapper "${PN}" "java -jar /opt/${PN}/${PN}.jar"
}

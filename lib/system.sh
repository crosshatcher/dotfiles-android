# ~/lib/system.sh

is_darwin () {
  [ `uname -s` == "Darwin" ]
}

is_freebsd () {
	[ `uname -s` == "FreeBSD" ]
}

is_openbsd () {
	[ `uname -s` == "OpenBSD" ]
}

is_linux () {
	[ `uname -s` == "Linux" ]
}

is_debian () {
	[ -f /etc/debian_version ]
}

is_ubuntu () {
    [ $(cat /etc/issue | awk '{print $1}') = "Ubuntu" ]
}

is_gentoo () {
	[ -f /etc/gentoo_release ]
}

is_alpine () {
  [ -f /etc/alpine-release ]
}

is_void () {
  [ -d /etc/xbps.d ]
}

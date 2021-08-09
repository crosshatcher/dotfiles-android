# .profile

# POSIX variables
# http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_03
export LANG=en_US.UTF-8
export LC_COLLATE=C
export EDITOR=vim VISUAL=vim
export PAGER=less
export PATH=${PATH:-/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin}
export DISPLAY=:0.0

# XDG path variables
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
[ -d ${XDG_CONFIG_HOME} ] || mkdir -p ${XDG_CONFIG_HOME}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
[ -d ${XDG_CACHE_HOME} ] || mkdir -p ${XDG_CACHE_HOME}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
[ -d ${XDG_DATA_HOME} ] || mkdir -p ${XDG_CONFIG_HOME}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/run/user/$(id -u)}

# XDG system path variable
# https://standards.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html.
export XDG_DATA_DIRS=${XDG_DATA_HOME}:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}

export LESS="-R -M"
export LESSOPEN="|lesspipe %s"
export LESSHISTFILE={XDG_CACHE_HOME}/less_history

export TMUX_TMPDIR=${XDG_RUNTIME_DIR}
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export RIPGREP_CONFIG_PATH=${XDG_CONFIG_HOME}/ripgreprc
export SSH_ASKPASS=gnome-ssh-askpass

# GCC
export MAKEOPTS='^-j$(($(getconf _NPROCESSORS_ONLN)+1)) --no-print-directory'
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:range1=32:range2=34:locus=01:quote=01:path=01;36:fixit-insert=32:fixit-delete=31:diff-filename=01:diff-hunk=32:diff-delete=31:diff-insert=32:type-diff=01;32"

# Golang
export GOPATH=${HOME}/.local/lib/go
export GOBIN=${HOME}/.local/bin


# Build a custom user path
prependpath () {
  case ":$PATH:" in
    *":$1:"*) ;;
           *) PATH="$1${PATH:+:$PATH}";;
  esac
}

PATH=
prependpath /sbin
prependpath /bin
prependpath /usr/sbin
prependpath /usr/bin
prependpath /usr/local/sbin
prependpath /usr/local/bin
prependpath /snap/bin
prependpath ${GOPATH}/bin
prependpath ${HOME}/.local/bin
prependpath ${HOME}/bin
unset prependpath
export PATH

# If running bash, we also want to source ~/.bashrc
[ $BASH_VERSION ] && [ -f ~/.bashrc ] && . ~/.bashrc

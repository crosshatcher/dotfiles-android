# ~/lib/stdout-log.sh

msg () {
    # bold/yellow
    printf "\033[1m\033[93m=>\033[m $@\n"
}

info () {
    # bold/black
    printf "\033[1m\033[90mINFO:\033[m $@\n"
}

warn () {
    # bold/orange
    printf "\033[1m\033[90mWARNING:\033[m $@\n"
}

error () {
    # bold/red
    printf "\033[1m\033[31mERROR:\033[m $@\n"
}

die () {
    local ret="$?"; error "$@"; exit "$ret"
}

# Some additional convenient functions, originated from requirements coming from
# my work on the AOSP platformand the 

spacer () {
    printf "\n"
}

bold () {
    printf "\033[1m$@\033[m\n"
}


command_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

cd_build() {
    if [[ -n "$RUBY_SOURCE" ]]; then
        cd "$RUBY_SOURCE" || exit 1
    else
        echo "RUBY_SOURCE not set"
        exit 1
    fi
}

if command_exists tput; then
    COLOR_GREEN="$(tput setaf 2 2>/dev/null)$(tput bold 2>/dev/null)"
    COLOR_RESET="$(tput sgr0 2>/dev/null)"
else
    COLOR_GREEN=""
    COLOR_RESET=""
fi

echo_run() {
    echo "${COLOR_GREEN}==> $@${COLOR_RESET}"
    "$@"
}

os="$(uname)"
alias is_linux=false
alias is_macos=false
alias is_windows=false
alias is_unix='is_linux || is_macos'

if [[ "$os" = Linux ]]; then
    alias is_linux=true
elif [[ "$os" = Darwin ]]; then
    alias is_macos=true
elif [[ "$os" =~ ^(MINGW|MSYS) ]]; then
    alias is_windows=true
else
    echo "Unrecognized OS: ${os}"
    exit 1
fi

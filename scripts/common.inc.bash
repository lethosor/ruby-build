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

is_linux() {
    [[ "$(uname)" = Linux ]]
}

is_macos() {
    [[ "$(uname)" = Darwin ]]
}

is_windows() {
    [[ "$(uname)" =~ ^(MINGW|MSYS) ]]
}

is_unix() {
    is_linux || is_macos
}

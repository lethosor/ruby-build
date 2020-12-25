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
    COLOR_GREEN="$(tput setaf 2)$(tput bold)"
    COLOR_RESET="$(tput sgr0)"
else
    COLOR_GREEN=""
    COLOR_RESET=""
fi

echo_run() {
    echo "${COLOR_GREEN}==> $@${COLOR_RESET}"
    "$@"
}

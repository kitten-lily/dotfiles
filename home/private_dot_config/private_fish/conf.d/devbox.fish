if type -q devbox
    # Use global devbox environment if devbox is installed
    devbox global shellenv --init-hook | sed 's/export __ETC_PROFILE_NIX_SOURCED="1";//' | sed 's/hash -r//' | source
end

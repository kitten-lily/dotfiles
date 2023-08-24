if type -q devbox
    # Use global devbox environment if devbox is installed
    devbox global shellenv --init-hook | sed 's/hash -r//' | source
end

#!/usr/bin/env fish
if type -q bat
    echo "Building bat cache..."
    bat cache --build
end

#!/usr/bin/env fish

# Install fisher if it wasn't already installed.
set installed 0

if not type -q fisher
    if not type -q xh
        echo "Failed to install fisher: xh not available"
        exit
    end

    echo "Installing fisher..."
    xhs --body https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    set installed 1
end

# Run fisher update if fisher was installed or fish_plugins was modified less than 5 minutes ago.
# TODO: Check if fish_plugins matches the _fisher_plugins variable instead
set modified (stat --format "%Y"  $HOME/.config/fish/fish_plugins)
set minutes_since_modified (math \((date +%s) - $modified\) / 60)

if test \( $minutes_since_modified -lt 5 \) -o \( $installed -eq 1 \)
    echo "Updating fish plugins..."
    fisher update > /dev/null
end

#!/usr/bin/env fish
if not type -q fisher
    if type -q xh
        xhs --body https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    else
        exit
    end
end

fisher update
if test -d $HOME/bin
    fish_add_path $HOME/bin
end

if test -d $HOME/.local/bin
    fish_add_path --append --global $HOME/.local/bin
end

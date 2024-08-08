if status --is-interactive
    if [ -d /home/linuxbrew/.linuxbrew ]
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    end
end

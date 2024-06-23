if not type -q npiperelay.exe; exit 0; end
if not type -q socat; exit 0; end

set -gx SSH_AUTH_SOCK $HOME/.ssh/agent.sock
# Need `ps -ww` to get non-truncated command for matching
# Use square brackets to generate a regex match for the process we want but that doesn't match the grep command running it!
set already_running $(ps -auxww | grep -q "[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent"; echo $status)

# Create .ssh directory if it doesn't exist
if not test -d $HOME/.ssh
    mkdir $HOME/.ssh
end

if test "$already_running" != "0"
    if test -S $SSH_AUTH_SOCK
        # Not expecting the socket to exist as the forwarding command isn't running (http://www.tldp.org/LDP/abs/html/fto.html)
        echo "Removing previous socket..."
        rm $SSH_AUTH_SOCK
    end

    echo "Starting SSH-Agent relay..."
    setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &
end

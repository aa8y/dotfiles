## Set default editor to Vim
set -x EDITOR vim

## Set application specific paths
set -gx BREW_HOME $HOME/.linuxbrew
# Run `mkdir -p $GOPATH/bin` the first time.
set -gx GOPATH $HOME/code/go
set -gx GOROOT $BREW_HOME/Cellar/go/1.9
set -gx NVM_DIR $HOME/.nvm

## Set global paths
set -gx PATH $HOME/.rbenv/shims $HOME/.linuxbrew/bin $HOME/.bin $GOPATH/bin $PATH
set -gx MANPATH (brew --prefix)/share/man $MANPATH
set -gx INFOPATH (brew --prefix)/share/info $INFOPATH

## Misc
nvm use stable

# LINUX ONLY
# Enable ssh-agent on reboot.
# Ref: http://stackoverflow.com/a/32438108/1379599
setenv SSH_ENV $HOME/.ssh/environment

function start_agent
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end

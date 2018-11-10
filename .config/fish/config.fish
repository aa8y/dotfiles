## Set default editor to Vim
set -x EDITOR vim

## Set application specific paths
# Run `git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew` the first time.
set -gx BREW_HOME $HOME/.linuxbrew
# Run `mkdir -p $GOPATH/bin` the first time.
set -gx GOPATH $HOME/code/go
# Run `brew install go`.
set -gx GOROOT $BREW_HOME/Cellar/go/1.9
# Java
set -gx JAVA_HOME $HOME/.sdkman/candidates/java/current
# Run `brew install nvm`.
set -gx NVM_DIR $HOME/.nvm

## Set global paths
set -gx PATH $BREW_HOME/bin $HOME/.local/bin $GOPATH/bin $JAVA_HOME/bin $PATH
set -gx PATH $HOME/.rbenv/shims $PATH
set -gx MANPATH (brew --prefix)/share/man $MANPATH
set -gx INFOPATH (brew --prefix)/share/info $INFOPATH

## AWS CLI autocomplete
# Ref: https://github.com/aws/aws-cli/issues/1079#issuecomment-252947755
test -x (which aws_completer); and \
  complete --command aws --no-files --arguments \
    '(begin; \
        set --local --export COMP_SHELL fish; \
        set --local --export COMP_LINE (commandline); \
        aws_completer | sed \'s/ $//\'; \
      end)'

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

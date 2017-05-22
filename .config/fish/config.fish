# Flink setup
set -x FLINK_SCALA_VERSION 2.10
set -x FLINK_VERSION 1.2.0
set -x FLINK_HOME $HOME/bin/flink/scala-$FLINK_SCALA_VERSION/$FLINK_VERSION

# Path for all the go code
set -x GOPATH $HOME/code/gocode

# https://github.com/passcod/nvm-fish-wrapper
set -x NVM_DIR ~/.nvm
source $HOME/.config/fish/nvm-wrapper/nvm.fish

# Scala setup
set -x SCALA_VERSION latest
set -x SCALA_HOME $HOME/bin/scala/$SCALA_VERSION

# Spark setup
set -x SPARK_VERSION 2.1.0
set -x SPARK_HOME $HOME/bin/spark/$SPARK_VERSION
set -x PYTHONPATH $SPARK_HOME/python $PYTHONPATH

# Update PATH to include Go, Rust and Scala Lang binaries.
set -gx PATH $GOPATH/bin $HOME/.cargo/bin $SCALA_HOME/bin $PATH

# Set default editor to Vim
set -x EDITOR vim

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

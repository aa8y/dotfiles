## These commands need to run when I run fish interactively
if status is-interactive
    ## Set default editor to Vim
    set -x EDITOR vim

    if not functions -q fisher
        set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
        curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
        fish -c fisher
    end

    ## Set application specific paths
    # LinuxBrew - Install in a separate home directory to enable binary usage
    # Ref: https://docs.brew.sh/Homebrew-on-Linux
    set -gx BREW_HOME /home/linuxbrew/.linuxbrew
    # Homebrew for Mac
    # Ref: https://brew.sh/
    set -gx BREW_HOME /opt/homebrew
    # Run `mkdir -p $GOPATH/bin` the first time.
    set -gx GOPATH $HOME/.local/opt/go
    # Run `brew install go`
    set -lx GOBASE $BREW_HOME/Cellar/go
    set -gx GOROOT (realpath $GOBASE)/(ls -rt $GOBASE | tail -1)
    # JVM
    # Install SDKMan: https://sdkman.io/install
    # Run: fisher install reitzig/sdkman-for-fish
    set -gx JVM_TOOLS_HOME $HOME/.sdkman/candidates
    set -gx GRADLE_HOME $JVM_TOOLS_HOME/gradle/current
    set -gx SBT_HOME $JVM_TOOLS_HOME/sbt/current
    set -gx SCALA_HOME $JVM_TOOLS_HOME/scala/current
    set -gx JAVA_HOME $HOME/.sdkman/candidates/java/current
    # Run: brew install nvm.
    # Run: fisher install FabioAntunes/fish-nvm
    set -gx NVM_DIR $HOME/.nvm

    ## Set global paths
    set -gx PATH $BREW_HOME/bin $HOME/.local/bin $GOPATH/bin $GRADLE_HOME/bin $JAVA_HOME/bin $SBT_HOME/bin $SCALA_HOME/bin $HOME/.rbenv/shims $PATH
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
end

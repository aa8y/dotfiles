# https://github.com/passcod/nvm-fish-wrapper
set -x NVM_DIR ~/.nvm
source $HOME/.config/fish/nvm-wrapper/nvm.fish

# Path for all the go code
set -x GOPATH $HOME/code/gocode

# Spark setup
set -x SPARK_VERSION 2.1.0
set -x SPARK_HOME $HOME/bin/spark/$SPARK_VERSION
set -x PYTHONPATH $SPARK_HOME/python $PYTHONPATH

# Flink setup
set -x FLINK_SCALA_VERSION 2.10
set -x FLINK_VERSION 1.2.0
set -x FLINK_HOME $HOME/bin/flink/scala-$FLINK_SCALA_VERSION/$FLINK_VERSION

# Set default editor to Vim
set -x EDITOR vim

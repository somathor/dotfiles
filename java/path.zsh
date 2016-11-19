if [[ -s "/usr/java/default" ]]; then
  export JAVA_HOME="/usr/java/default"
  export PATH="$PATH:$JAVA_HOME/bin"
fi

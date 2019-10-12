#!/bin/bash

readonly JMI_ROOT_DIR=~/kaggle
readonly JMI_BROWSER_NAME=google-chrome

####################### Help message
showHelp() {
  echo "######################################################"
  echo "Usage of JMI: Jupyter-notebook Management Interface"
  echo ""
  echo "  ./jmi.sh go  : Launch notebook and browser as usual"
  echo "  ./jmi.sh kill: Kill existing process of Jupyter-notebook"
  echo "######################################################"
}

####################### Functions
getServerList() {
  echo $(jupyter notebook list | grep -v "running server")
}

jupyterServerExists() {
  if [ -n "$(getServerList)" ]
  then
    true
  else
    false
  fi
}

getServerUrl() {
  echo $(getServerList | cut -d' ' -f1)
}

jmi-go() {
  #### Launch jupyter if it doesn't exist
  if jupyterServerExists
  then
    echo "Jupyter is already running"
  else
    echo "Jupyter is not running, launching new one"
    jupyter notebook &
  fi


  #### Wait until jupyter gets launched
  while true
  do
    if jupyterServerExists
    then
      echo "Now jupyter is ready!"
      break
    else
      echo "Waiting until jupyter gets ready..."
      sleep 1
    fi
  done

  #### Launch browser
  $JMI_BROWSER_NAME $(getServerUrl) &
}

jmi-kill() {
  jupyter_pid=$(pgrep jupyter-note)

  if [ -n "$jupyter_pid" ]
  then
    kill -KILL $jupyter_pid
    echo "Killed PID=$jupyter_pid"
  else
    echo "No exisiting process of Jupyter-notebook"
  fi
}


####################### Main
cd $JMI_ROOT_DIR

# Check option is specified
if [ $# -ne 1 ]
then
  showHelp
  exit 1
fi

# Execute as the option tells to do
if [ $1 == "go" ]
then
  jmi-go

elif [ $1 == "kill" ]
then
  jmi-kill

else
  showHelp
  exit 1
fi




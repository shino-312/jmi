# jmi
Jupyter-notebook Management Interface

## What is this?

**This is a kind of Jupyter-notebook launcher.**

I recommend this if you want to launch/shutdown notebook with one command from anywhere on your computer.

## Usage

### Launch

```
./jmi.sh go
```
1. Check if Jupyter-notebook process exists
2. Launch new process only when it doesn't exist
3. Open web browser

### Shutdown

```
./jmi.sh kill
```
1. Check if Jupyter-notebook process exists
2. Kill the process only when it exists

### Alias

It's useful to create their aliases.
```
alias j='./jmi.sh go >> /tmp/jmilog.txt 2>&1'`
alias jk='./jmi.sh kill >> /tmp/jmilog.txt 2>&1'`
```

## Variables for You

Please rewrite these variables as you like.

```
readonly JMI_ROOT_DIR=~/kaggle
readonly JMI_BROWSER_NAME=google-chrome
```

## Other Tips

In default, `jupyter-notebook` command opens your browser automatically.
If you use this launcher, it's recommended to disable it as below.

1. Open `$(jupyter --config-dir)/jupyter_notebook_config.py`. If it doesn't exist, create with `jupyter notebook --generate-config`.
2. Find `#c.NotebookApp.open_browser = True`
3. Change it to `c.NotebookApp.open_browser = False`


Thanks.


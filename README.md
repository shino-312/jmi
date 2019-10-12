# jmi
Jupyter-notebook Management Interface

## What is this?

**This is a kind of Jupyter-notebook launcher.**

I recommend this if you want to launch/shutdown notebook with one command from anywhere on your computer.

## Usage

### Launch

It's useful to create aliases for the following commands such as `alias j='./jmi.sh go'`

```
./jmi.sh go
```
1. Check if Jupyter-notebook already exists
2. Launch new process only when it doesn't exist
3. Open web browser

### Shutdown

```
./jmi.sh kill
```
1. Check if Jupyter-notebook already exists
2. Kill the process only when it exists

## Variable

Please rewrite these variables as you like.

```
readonly JMI_ROOT_DIR=~/kaggle
readonly JMI_BROWSER_NAME=google-chrome
```

Thanks.


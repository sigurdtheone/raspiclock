#!/bin/bash

TTY_PID=$(ps -ef | grep -E "sigurd.*tty1" | grep -v grep | awk '{print $2}')

bash -c "$1 > /proc/$TTY_PID/fd/0"

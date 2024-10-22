tmux new-session -d \; send-keys '~/scripts/raspiclock/termclock.sh' C-m \; split-window -v \; resize-pane -t 0 -y 6 \; send-keys 'cmatrix -C Blue' C-m \; set-option -g status off \; attach

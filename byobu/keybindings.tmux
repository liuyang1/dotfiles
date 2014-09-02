unbind-key -n C-a
set -g prefix ^A
set -g prefix2 ^A
bind a send-prefix

unbind '"'
bind - splitw -v
bind _ splitw -v
unbind %
bind | splitw -h
bind \ splitw -h
unbind C-\
bind C-\ splitw -h

bind k selectp -U
bind j selectp -D
unbind H
bind H selectp -L
unbind C-h
bind C-h selectp -L
bind h selectp -L
bind l selectp -R
bind ; selectp -R

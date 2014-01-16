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

bind k selectp -U
bind j selectp -D
bind h selectp -L
bind l selectp -R
